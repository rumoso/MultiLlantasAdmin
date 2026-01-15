import { Component } from '@angular/core';
import { SharedModule } from '../../../../shared/Shared.module';
import { MaterialModule } from '../../../../shared/material.module';
import { environment } from '../../../../../environments/environment';
import { Pagination, ResponseDB_CRUD, ResponseGet } from '../../../interfaces/global.interfaces';
import { ServicesGService } from '../../../../servicesG/servicesG.service';
import { RolesService } from '../../../services/roles.service';
import { AuthService } from '../../../../auth/services/auth.service';
import { HttpErrorResponse } from '@angular/common/http';
import { RoleComponent } from '../mdl/role/role.component';

@Component({
  selector: 'app-role-list',
    imports: [
    SharedModule,
    MaterialModule,
  ],
  templateUrl: './role-list.component.html',
  styleUrl: './role-list.component.css'
})
export default class RoleListComponent {
  //#region VARIABLES
  private _appMain: string = environment.appMain;

  title = 'Lista de roles';
  bShowSpinner: boolean = false;
  catlist: any[] = [];
  
  //-------------------------------
  // VARIABLES PARA LA PAGINACIÓN
  iRows: number = 0;
  pagination: Pagination = {
    search:'',
    length: 10,
    pageSize: 10,
    pageIndex: 0,
    pageSizeOptions: [5, 10, 25, 100]
  }
  //-------------------------------

  //#end region

  constructor(
    private servicesGServ: ServicesGService
    , private rolesServ: RolesService
    , private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.authService.checkSession();
    
    this.fn_getRolesListWithPage();
  }

  //#region METODOS DE FRONT

  fn_deleteRol( id: number ){

    this.servicesGServ.showDialog('¿Estás seguro?'
                                      , 'Está a punto de borrar el rol'
                                      , '¿Desea continuar?'
                                      , 'Si', 'No')
    .afterClosed().subscribe({
      next: ( resp ) =>{
        if(resp){
          this.bShowSpinner = true;

          var oParam: any = {
            idRol: id
          }
          
          this.rolesServ.CDeleteRol( oParam )
          .subscribe({
            next: (resp: ResponseDB_CRUD) => {
              if( resp.status === 0 ){
                this.fn_getRolesListWithPage();
              }
              this.servicesGServ.showSnakbar(resp.message);
              this.bShowSpinner = false;
            },
            error: (ex: HttpErrorResponse) => {
              console.log( ex )
              this.servicesGServ.showSnakbar( ex.error.data );
              this.bShowSpinner = false;
            }
      
          })

        }
      }
    });
  }

  ////************************************************ */

  showActionsConf( id: number, name: string ){

    var oData: any = {
      relationType: 'R',
      idRelation: id,
      description: 'Permisos del Rol: ' + name
    }

    // this.servicesGServ.showModalWithParams( ActionsconfComponent, oData, '1500px')
    // .afterClosed().subscribe({
    //   next: ( resp: any ) =>{

    //     //this.fn_getCustomersListWithPage();
        
    //   }
    // });
  }

  showMenusPermisos( id: number, name: string ){

    var oData: any = {
      relationType: 'R',
      idRelation: id,
      description: 'Permisos del Rol: ' + name
    }

    // this.servicesGServ.showModalWithParams( MenupermisosComponent, oData, '1500px')
    // .afterClosed().subscribe({
    //   next: ( resp: any ) =>{

    //     //this.fn_getCustomersListWithPage();
        
    //   }
    // });
  }

  // MÉTODOS DE PAGINACIÓN
  changePagination(pag: Pagination) {
    this.pagination = pag;
    this.fn_getRolesListWithPage();
  }

  onChangeEvent(event: any){
    this.pagination.search = event.target.value;
    this.fn_getRolesListWithPage();
  }
  ////************************************************ */

  changeRoute( route: string ): void {
    this.servicesGServ.changeRoute( `/${ this._appMain }/${ route }` );
  }

  showRole( id: number ){

    var oData: any = {
      id
    }

    this.servicesGServ.showModalWithParams( RoleComponent, oData, '1500px')
    .afterClosed().subscribe({
      next: ( resp: any ) =>{

        this.fn_getRolesListWithPage();
        
      }
    });
  }

  //#end region

  //#region CONEXIONES CON EL BACK

  fn_getRolesListWithPage() {

    this.bShowSpinner = false;

    this.rolesServ.CGetRolesListWithPage( this.pagination )
    .subscribe({
      next: (resp: ResponseGet) => {
        this.catlist = resp.data.rows;
        this.pagination.length = resp.data.count;
        this.bShowSpinner = false;
      },
      error: (ex: HttpErrorResponse) => {
        console.log( ex.error.errors[0].msg )
        this.servicesGServ.showSnakbar( ex.error.errors[0].msg );
        this.bShowSpinner = false;
      }
    })
  }

  //#end region

}

