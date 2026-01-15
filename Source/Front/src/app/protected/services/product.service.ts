import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../auth/services/auth.service';
import { Observable } from 'rxjs';
import { Pagination, ResponseDB_CRUD, ResponseGet } from '../interfaces/global.interfaces';

@Injectable({
  providedIn: 'root'
})
export class ProductosService {

  private baseURL: string = environment.baseUrl;
  _api: string = 'api/productos';

  constructor(private http: HttpClient, private authServ: AuthService) { }

  /**
   * Obtener productos con paginación
   */
  getProductosPaginado(pagination: Pagination, filters: any): Observable<ResponseGet> {
    const data = {
      search: pagination.search,
      start: pagination.pageIndex * pagination.pageSize,
      limiter: pagination.pageSize,
      idUserLogON: this.authServ.getIdUserSession()
    };

    return this.http.post<ResponseGet>(`${this.baseURL}/${this._api}/getProductsPag`, data);
  }

  /**
   * Obtener producto por ID
   */
  CGetProductoByID(data: { idProducto: number }): Observable<any> {
    return this.http.post<any>(`${this.baseURL}/${this._api}/getProductById`, data);
  }

  /**
   * Guardar o Actualizar producto
   */
  GuardarProducto(data: FormData): Observable<ResponseDB_CRUD> {
    // We send it as FormData to support image uploads
    return this.http.post<ResponseDB_CRUD>(`${this.baseURL}/${this._api}/saveProduct`, data);
  }

  /**
   * Eliminar producto (Baja lógica)
   */
  EliminarProducto(idProducto: number): Observable<ResponseGet> {
    return this.http.post<ResponseGet>(`${this.baseURL}/${this._api}/deleteProduct`, { idProducto });
  }

  /**
   * Obtener lista de marcas (Para filtros o combos)
   */
  getMarcas(): Observable<ResponseGet> {
    return this.http.get<ResponseGet>(`${this.baseURL}/${this._api}/getMarcas`);
  }
}
