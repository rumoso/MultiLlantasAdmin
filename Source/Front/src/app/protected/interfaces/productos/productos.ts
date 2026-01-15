export interface Productos {
  idProducto: number;
  nombre: string;
  descripcion: string;
  marca: string;
  modelo: string;
  ancho: string;
  perfil: string;
  rin: string;
  precio: number;
  imagen_url: string | null;
  activo: boolean;
  createDate: Date;
  updateDate?: Date;
}
