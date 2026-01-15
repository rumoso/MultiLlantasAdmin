const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');
// const { validarJWT } = require('../middlewares/validar-jwt'); // Para rutas protegidas ADMIN

const {
    getProductsPag,
    getProductById,
    getProductsByMarca,
    getMarcas,
    saveProduct,
    deleteProduct
} = require('../controllers/productosController');

const router = Router();

/**
 * Obtener productos con paginación
 * POST /api/productos/getProductsPag
 */
router.post('/getProductsPag', [
    check('start').optional().isInt({ min: 0 }),
    check('limiter').optional().isInt({ min: 1, max: 100 }),
    validarCampos
], getProductsPag);

/**
 * Obtener producto por ID
 * POST /api/productos/getProductById
 */
router.post('/getProductById', [
    check('idProducto', 'El ID del producto es obligatorio').notEmpty(),
    check('idProducto', 'El ID debe ser un número').isInt(),
    validarCampos
], getProductById);

/**
 * Obtener productos por marca con paginación
 * POST /api/productos/getProductsByMarca
 */
router.post('/getProductsByMarca', [
    check('marca', 'La marca es obligatoria').notEmpty(),
    check('start').optional().isInt({ min: 0 }),
    check('limiter').optional().isInt({ min: 1, max: 100 }),
    validarCampos
], getProductsByMarca);

/**
 * Obtener lista de marcas
 * GET /api/productos/getMarcas
 */
router.get('/getMarcas', getMarcas);

/**
 * Guardar o actualizar producto
 * POST /api/productos/saveProduct
 */
router.post('/saveProduct', saveProduct);

/**
 * Eliminar producto (Baja lógica)
 * POST /api/productos/deleteProduct
 */
router.post('/deleteProduct', deleteProduct);

module.exports = router;
