const response_express = require('express');
const Op_sequelize = require('sequelize');
const { dbConnection, dbSPConnection } = require('../database/config');

const getProductsPag = async (req, res) => {
    var {
        search = ''
        , limiter = 10
        , start = 0
        , idUserLogON
    } = req.body;
    console.log(req.body);
    try {

        const query = `
            WITH RECURSIVE words AS (
                SELECT
                    SUBSTRING_INDEX(?, ' ', 1) AS palabra,
                    CASE WHEN LOCATE(' ', ?) > 0 THEN SUBSTRING(?, LOCATE(' ', ?) + 1) ELSE '' END AS rest
                UNION ALL
                SELECT
                    SUBSTRING_INDEX(rest, ' ', 1) AS palabra,
                    CASE WHEN LOCATE(' ', rest) > 0 THEN SUBSTRING(rest, LOCATE(' ', rest) + 1) ELSE '' END AS rest
                FROM words
                WHERE rest <> ''
            ),
            matches AS (
                SELECT
                    P.idProducto,
                    P.nombre,
                    P.descripcion,
                    P.marca,
                    P.modelo,
                    P.ancho,
                    P.perfil,
                    P.rin,
                    P.precio,
                    P.stock,
                    P.imagen_url,
                    P.activo,
                    P.createDate,
                    (
                        SELECT COUNT(*) 
                        FROM words w
                        WHERE CONCAT(
                            IFNULL(P.nombre, ''),
                            ' ', IFNULL(P.marca, ''),
                            ' ', IFNULL(P.modelo, ''),
                            ' ', IFNULL(P.descripcion, ''),
                            ' ', IFNULL(P.ancho, ''),
                            '/', IFNULL(P.perfil, ''),
                            ' R', IFNULL(P.rin, '')
                        ) LIKE CONCAT('%', w.palabra, '%')
                    ) AS iCountWords
                FROM productos AS P
                WHERE
                    ? = ''
                    OR EXISTS (
                        SELECT 1 
                        FROM words w
                        WHERE CONCAT(
                            IFNULL(P.nombre, ''),
                            ' ', IFNULL(P.marca, ''),
                            ' ', IFNULL(P.modelo, ''),
                            ' ', IFNULL(P.descripcion, ''),
                            ' ', IFNULL(P.ancho, ''),
                            '/', IFNULL(P.perfil, ''),
                            ' R', IFNULL(P.rin, '')
                        ) LIKE CONCAT('%', w.palabra, '%')
                    )
            ),
            total AS (
                SELECT COUNT(*) as iRows FROM matches
            )
            SELECT 
                matches.*, 
                total.iRows 
            FROM matches, total
            ORDER BY iCountWords DESC, marca ASC, nombre ASC
            LIMIT ?, ?;
        `;

        const result = await dbConnection.query(query, {
            replacements: [
                search, search, search, search, // for words CTE
                search, // for where clause
                parseInt(start),
                parseInt(limiter)
            ],
            type: Op_sequelize.QueryTypes.SELECT
        });

        const iRows = result.length > 0 ? result[0].iRows : 0;

        res.json({
            status: 0,
            message: 'Ejecutado correctamente.',
            data: {
                count: iRows,
                rows: result
            }
        });
    } catch (error) {
        res.json({
            status: 2,
            message: 'Sucedió un error inesperado',
            data: error.message
        });
    }
};

/**
 * Obtiene un producto por ID
 */
const getProductById = async (req, res = response_express.response) => {
    try {
        const { idProducto } = req.body;

        const query = `
            SELECT
                idProducto,
                nombre,
                descripcion,
                marca,
                modelo,
                ancho,
                perfil,
                rin,
                precio,
                stock,
                imagen_url,
                activo,
                createDate
            FROM productos
            WHERE idProducto = ?
        `;

        const [rows] = await dbSPConnection.query(query, [idProducto]);

        if (rows.length === 0) {
            return res.json({
                status: 1,
                message: 'Producto no encontrado',
                data: null
            });
        }

        return res.json({
            status: 0,
            message: 'Producto obtenido correctamente',
            data: rows[0]
        });

    } catch (error) {
        console.error('Error en getProductById:', error);
        return res.json({
            status: 2,
            message: 'Error al obtener producto',
            data: error.message
        });
    }
};

/**
 * Obtiene productos por marca con paginación
 */
const getProductsByMarca = async (req, res = response_express.response) => {
    try {
        const { marca, search = '', start = 0, limiter = 10 } = req.body;

        const query = `
            SELECT
                idProducto,
                nombre,
                descripcion,
                marca,
                modelo,
                ancho,
                perfil,
                rin,
                precio,
                stock,
                imagen_url,
                activo,
                createDate
            FROM productos
            WHERE 1 = 1
                AND marca = ?
                AND (
                    nombre LIKE ?
                    OR modelo LIKE ?
                    OR descripcion LIKE ?
                )
            ORDER BY nombre ASC
            LIMIT ?, ?
        `;

        const countQuery = `
            SELECT COUNT(*) as total
            FROM productos
            WHERE 1 = 1
                AND marca = ?
                AND (
                    nombre LIKE ?
                    OR modelo LIKE ?
                    OR descripcion LIKE ?
                )
        `;

        const searchPattern = `%${search}%`;
        const searchParams = [marca, searchPattern, searchPattern, searchPattern];

        const [rows] = await dbSPConnection.query(query, [...searchParams, parseInt(start), parseInt(limiter)]);
        const [countResult] = await dbSPConnection.query(countQuery, searchParams);

        const total = countResult[0].total;

        return res.json({
            status: 0,
            message: 'Productos obtenidos correctamente',
            data: {
                total: total,
                rows: rows
            }
        });

    } catch (error) {
        console.error('Error en getProductsByMarca:', error);
        return res.json({
            status: 2,
            message: 'Error al obtener productos por marca',
            data: error.message
        });
    }
};

/**
 * Obtiene lista de marcas disponibles
 */
const getMarcas = async (req, res = response_express.response) => {
    try {
        const query = `
            SELECT DISTINCT marca
            FROM productos
            ORDER BY marca ASC
        `;

        const [rows] = await dbSPConnection.query(query);

        return res.json({
            status: 0,
            message: 'Marcas obtenidas correctamente',
            data: rows
        });

    } catch (error) {
        console.error('Error en getMarcas:', error);
        return res.json({
            status: 2,
            message: 'Error al obtener marcas',
            data: error.message
        });
    }
};



/**
 * Guarda o actualiza un producto
 */
const saveProduct = async (req, res = response_express.response) => {
    try {
        const { producto: productoRaw } = req.body;
        const producto = JSON.parse(productoRaw);

        let imagen_url = producto.imagen_url;

        // Manejo de imagen si se subió una nueva
        if (req.files && req.files.image) {
            const file = req.files.image;
            const extension = file.name.split('.').pop();
            const fileName = `${Date.now()}.${extension}`;
            const uploadPath = `./public/img/productos/${fileName}`;

            await file.mv(uploadPath);
            imagen_url = `img/productos/${fileName}`;
        }

        const query = `
            INSERT INTO productos (
                idProducto, nombre, descripcion, marca, modelo, 
                ancho, perfil, rin, precio, stock, 
                imagen_url, activo, createDate, updateDate
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
            ON DUPLICATE KEY UPDATE
                nombre = VALUES(nombre),
                descripcion = VALUES(descripcion),
                marca = VALUES(marca),
                modelo = VALUES(modelo),
                ancho = VALUES(ancho),
                perfil = VALUES(perfil),
                rin = VALUES(rin),
                precio = VALUES(precio),
                stock = VALUES(stock),
                imagen_url = IFNULL(?, imagen_url),
                activo = VALUES(activo),
                updateDate = NOW()
        `;

        const params = [
            producto.idProducto || null,
            producto.nombre,
            producto.descripcion,
            producto.marca,
            producto.modelo,
            producto.ancho,
            producto.perfil,
            producto.rin,
            producto.precio,
            producto.stock,
            imagen_url,
            producto.activo ? 1 : 0,
            imagen_url // para el duplicate key update
        ];

        await dbSPConnection.query(query, params);

        return res.status(200).json({
            status: 0,
            message: 'Producto guardado correctamente',
            data: null
        });

    } catch (error) {
        console.error('Error en saveProduct:', error);
        return res.status(500).json({
            status: 2,
            message: 'Error al guardar producto',
            error: error.message
        });
    }
};

/**
 * Elimina un producto (Baja lógica)
 */
const deleteProduct = async (req, res = response_express.response) => {
    try {
        const { idProducto } = req.body;

        const query = `UPDATE productos SET activo = 0, updateDate = NOW() WHERE idProducto = ?`;
        await dbSPConnection.query(query, [idProducto]);

        return res.status(200).json({
            status: 0,
            message: 'Producto eliminado correctamente'
        });

    } catch (error) {
        console.error('Error en deleteProduct:', error);
        return res.status(500).json({
            status: 2,
            message: 'Error al eliminar producto',
            error: error.message
        });
    }
};

module.exports = {
    getProductsPag,
    getProductById,
    getProductsByMarca,
    getMarcas,
    saveProduct,
    deleteProduct
};
