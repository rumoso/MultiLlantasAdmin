import { CommonModule } from '@angular/common';
import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { SharedModule } from '../../../../shared/Shared.module';
import { MaterialModule } from '../../../../shared/material.module';
import { FormsModule } from '@angular/forms';
import { SpinnerComponent } from '../../../../components/spinner/spinner.component';
import { PaginationComponent } from '../../../../components/pagination/pagination.component';
import { ServicesGService } from '../../../../servicesG/servicesG.service';
import { ProductosService } from '../../../services/product.service';
import { AuthService } from '../../../../auth/services/auth.service';
import { ProductComponent } from '../mdl/product/product.component';
import { HttpErrorResponse } from '@angular/common/http';
import { Pagination, ResponseGet } from '../../../interfaces/global.interfaces';

@Component({
  selector: 'app-product-list',
  standalone: true,
  imports: [
    CommonModule,
    SharedModule,
    MaterialModule,
    FormsModule,
    SpinnerComponent,
    PaginationComponent
  ],
  templateUrl: './product-list.component.html',
  styleUrl: './product-list.component.css'
})
export class ProductListComponent implements OnInit {

  title = 'Catálogo de Productos';
  bShowSpinner: boolean = false;
  catlist: any[] = [];

  prod_CrearEditarEliminar: boolean = false;
  idUserLogON: number = 0;

  oParameters: any = {
    search: ''
  }

  //-------------------------------
  // VARIABLES PARA LA PAGINACIÓN
  pagination: Pagination = {
    search: '',
    length: 0,
    pageSize: 10,
    pageIndex: 0,
    pageSizeOptions: [5, 10, 25, 100]
  }
  //-------------------------------

  constructor(
    private servicesGServ: ServicesGService,
    private productoService: ProductosService,
    private authServ: AuthService,
    private cdref: ChangeDetectorRef
  ) { }

  async ngOnInit() {
    this.authServ.checkSession();
    this.idUserLogON = await this.authServ.getIdUserSession();

    // const oActions = await this.authServ.CGetActionsPermissionPromise(this.idUserLogON);
    // this.prod_CrearEditarEliminar = oActions?.some((action: any) => action.name === 'prod_CrearEditarEliminar');
    this.prod_CrearEditarEliminar = true;


    this.getProductosWithPage();
  }

  showProducto(id: number = 0) {
    const oData: any = { id, title: id > 0 ? 'Editar Producto' : 'Nuevo Producto' };

    this.servicesGServ.showModalWithParams(ProductComponent, oData, '1000px')
      .afterClosed().subscribe({
        next: (resp: any) => {
          if (resp) this.getProductosWithPage();
        }
      });
  }

  getProductosWithPage() {
    this.bShowSpinner = true;

    // Using getProductosPaginado which is already in the service
    this.productoService.getProductosPaginado(this.pagination, this.oParameters)
      .subscribe({
        next: (resp: any) => {
          if (resp.status === 0) {
            this.catlist = resp.data.rows;
            this.pagination.length = resp.data.count;
          }
          this.bShowSpinner = false;
          this.cdref.detectChanges();
        },
        error: (ex: HttpErrorResponse) => {
          this.servicesGServ.showSnakbar("Error al cargar productos");
          this.bShowSpinner = false;
          this.cdref.detectChanges();
        }
      });
  }

  EliminarProducto(id: number) {
    this.servicesGServ.showDialog('¿Estás seguro?'
      , 'Está a punto de borrar un producto'
      , '¿Desea continuar?'
      , 'Si', 'No')
      .afterClosed().subscribe({
        next: (resp) => {
          if (resp) {
            this.bShowSpinner = true;
            this.productoService.EliminarProducto(id)
              .subscribe({
                next: (resp: ResponseGet) => {
                  this.getProductosWithPage();
                },
                error: (ex: HttpErrorResponse) => {
                  this.servicesGServ.showSnakbar("Error al eliminar producto");
                  this.bShowSpinner = false;
                }
              });
          }
        }
      });
  }

  onChangeEvent(event: any) {
    this.pagination.search = event.target.value;
    this.pagination.pageIndex = 0; // Reset pagination on search
    this.getProductosWithPage();
  }

  changePagination(pag: Pagination) {
    this.pagination = pag;
    this.getProductosWithPage();
  }
}
