import { Component } from '@angular/core';
import { SharedModule } from '../../../../shared/Shared.module';
import { MaterialModule } from '../../../../shared/material.module';
import { environment } from '../../../../../environments/environment';
import { Pagination, ResponseDB_CRUD, ResponseGet } from '../../../interfaces/global.interfaces';
import { ServicesGService } from '../../../../servicesG/servicesG.service';
import { UsersService } from '../../../services/users.service';
import { AuthService } from '../../../../auth/services/auth.service';
import { UserComponent } from '../mdl/user/user.component';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
    selector: 'app-user-list',
    imports: [
        SharedModule,
        MaterialModule,
    ],
    templateUrl: './user-list.component.html',
    styleUrl: './user-list.component.css'
})

export default class UserListComponent {

    //#region VARIABLES

    private _appMain: string = environment.appMain;

    title = 'Lista de usuarios';
    bShowSpinner: boolean = false;
    catlist: any[] = [];

    //-------------------------------
    // VARIABLES PARA LA PAGINACIÓN
    iRows: number = 0;
    pagination: Pagination = {
        search: '',
        length: 10,
        pageSize: 10,
        pageIndex: 0,
        pageSizeOptions: [5, 10, 25, 100]
    }
    //-------------------------------

    //#end region

    constructor(
        private servicesGServ: ServicesGService
        , private usersServ: UsersService
        , private authServ: AuthService
    ) { }

    ngOnInit(): void {
        this.authServ.checkSession();

        this.fn_getUsersListWithPage();
    }

    //#region METODOS DE FRONT

    showUser(id: number) {

        var oData: any = {
            id
        }

        this.servicesGServ.showModalWithParams(UserComponent, oData, '1500px')
            .afterClosed().subscribe({
                next: (resp: any) => {

                    this.fn_getUsersListWithPage();

                }
            });
    }

    showActionsConf(id: number, name: string) {

        var oData: any = {
            relationType: 'U',
            idRelation: id,
            description: 'Permisos del Usuario: ' + name
        }

        // this.servicesGServ.showModalWithParams(ActionsconfComponent, oData, '1500px')
        //   .afterClosed().subscribe({
        //     next: (resp: any) => {

        //       //this.fn_getCustomersListWithPage();

        //     }
        //   });
    }

    showMenusPermisos(id: number, name: string) {

        var oData: any = {
            relationType: 'U',
            idRelation: id,
            description: 'Permisos del Usuario: ' + name
        }

        // this.servicesGServ.showModalWithParams(MenupermisosComponent, oData, '1500px')
        //   .afterClosed().subscribe({
        //     next: (resp: any) => {

        //       //this.fn_getCustomersListWithPage();

        //     }
        //   });
    }

    ////************************************************ */
    // MÉTODOS DE PAGINACIÓN
    changePagination(pag: Pagination) {
        this.pagination = pag;
        this.fn_getUsersListWithPage();
    }

    onChangeEvent(event: any) {
        this.pagination.search = event.target.value;
        this.fn_getUsersListWithPage();
    }
    ////************************************************ */

    changeRoute(route: string): void {
        this.servicesGServ.changeRoute(`/${this._appMain}/${route}`);
    }

    hasPermissionAction(action: string): boolean {
        return this.authServ.hasPermissionAction(action);
    }

    //#end region

    //#region CONEXIONES CON EL BACK

    fn_getUsersListWithPage() {

        this.bShowSpinner = true;
        this.usersServ.CGetUsersListWithPage(this.pagination)
            .subscribe({
                next: (resp: ResponseGet) => {
                    this.catlist = resp.data.rows;
                    this.pagination.length = resp.data.count;
                    this.bShowSpinner = false;
                },
                error: (ex: HttpErrorResponse) => {
                    console.log(ex.error.errors[0].msg)
                    this.servicesGServ.showSnakbar(ex.error.errors[0].msg);
                    this.bShowSpinner = false;
                }
            })
    }

    fn_deleteUser(idUser: number) {

        this.servicesGServ.showDialog('¿Estás seguro?'
            , 'Está a punto de deshabilitar al usuario'
            , '¿Desea continuar?'
            , 'Si', 'No')
            .afterClosed().subscribe({
                next: (resp) => {
                    if (resp) {
                        this.bShowSpinner = true;
                        this.usersServ.CDisabledUser(idUser)
                            .subscribe({
                                next: (resp: ResponseDB_CRUD) => {
                                    this.fn_getUsersListWithPage();
                                    this.servicesGServ.showAlertIA(resp);
                                    this.bShowSpinner = false;
                                },
                                error: (ex: HttpErrorResponse) => {
                                    console.log(ex)
                                    this.servicesGServ.showSnakbar(ex.error.data);
                                    this.bShowSpinner = false;
                                }

                            })
                    }
                }
            });
    }

    //#end region

}
