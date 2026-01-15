import { Component, Inject } from '@angular/core';
import { SharedModule } from '../../../../../shared/Shared.module';
import { MaterialModule } from '../../../../../shared/material.module';
import { environment } from '../../../../../../environments/environment';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ServicesGService } from '../../../../../servicesG/servicesG.service';
import { AuthService } from '../../../../../auth/services/auth.service';
import { RolesService } from '../../../../services/roles.service';
import { ResponseDB_CRUD } from '../../../../interfaces/global.interfaces';

@Component({
  selector: 'app-role',
  imports: [
    SharedModule,
    MaterialModule,
  ],
  templateUrl: './role.component.html',
  styleUrl: './role.component.css'
})
export class RoleComponent {

  //#region VARIABLES

  private _appMain: string = environment.appMain;

  idUserLogON: number = 0;

  title: string = 'Rol';
  bShowSpinner: boolean = false;
  id: number = 0;

  rolForm: any = {
    idRol: 0,
    name: '',
    description: '',
    active: true
  };

  //#end region

  constructor(
    private dialogRef: MatDialogRef<RoleComponent>
    , @Inject(MAT_DIALOG_DATA) public OData: any

    , private servicesGServ: ServicesGService
    , private authServ: AuthService

    , private rolesServ: RolesService
  ) { }

  ngOnInit() {
    this.authServ.checkSession();
    this.idUserLogON = this.authServ.getIdUserSession();

    if (this.OData.id > 0) {

      this.bShowSpinner = true;

      this.rolesServ.CGetRolByID(this.OData.id)
        .subscribe((resp: any) => {

          if (resp.status == 0) {

            this.id = resp.data.idRol;

            this.rolForm = {
              idRol: resp.data.idRol,
              name: resp.data.name,
              description: resp.data.description,
              active: resp.data.active
            };

          } else {
            this.servicesGServ.showSnakbar(resp.message);
          }
          this.bShowSpinner = false;
        });

    }

    setTimeout(() => {
      this.ev_fn_nextInput_keyup_enter('tbxName');
    }, 500);

  }

  //#region METODOS DE FRONT

  ev_fn_nextInput_keyup_enter(idInput: any) {
    //console.log(150)
    setTimeout(() => {
      // idInput.nativeElement.focus();
      var miElemento = document.getElementById(idInput)!.focus();
    }, 100);

  }

  close() {
    this.dialogRef.close(true);
  }

  //#end region

  //#region CONEXIONES CON EL BACK

  fn_saveRol() {

    this.bShowSpinner = true;

    if (this.id > 0) {
      this.rolesServ.CUpdateRol(this.rolForm)
        .subscribe({
          next: (resp: ResponseDB_CRUD) => {

            this.servicesGServ.showAlertIA(resp);
            this.bShowSpinner = false;

          },
          error: (ex) => {

            this.servicesGServ.showSnakbar("Problemas con el servicio");
            this.bShowSpinner = false;

          }
        })
    } else {
      this.rolesServ.CInsertRol(this.rolForm)
        .subscribe({
          next: (resp: ResponseDB_CRUD) => {

            if (resp.status === 0) {

              this.id = resp.insertID;

              this.rolForm.idRol = resp.insertID;

            }

            this.servicesGServ.showAlertIA(resp);

            this.bShowSpinner = false;

          },
          error: (ex) => {

            this.servicesGServ.showSnakbar("Problemas con el servicio");
            this.bShowSpinner = false;

          }
        })
    }
  }

  //#end region

}
