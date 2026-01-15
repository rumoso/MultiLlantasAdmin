import { Component, Inject } from '@angular/core';
import { SharedModule } from '../../../../../shared/Shared.module';
import { MaterialModule } from '../../../../../shared/material.module';
import { environment } from '../../../../../../environments/environment';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ActivatedRoute } from '@angular/router';
import { ServicesGService } from '../../../../../servicesG/servicesG.service';
import { DateAdapter, MAT_DATE_LOCALE } from '@angular/material/core';
import { UsersService } from '../../../../services/users.service';
import { RolesService } from '../../../../services/roles.service';
import { AuthService } from '../../../../../auth/services/auth.service';
import { ResponseDB_CRUD, ResponseGet } from '../../../../interfaces/global.interfaces';
import { HttpErrorResponse } from '@angular/common/http';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';

@Component({
  selector: 'app-user',
  imports: [
    SharedModule,
    MaterialModule,
  ],
  templateUrl: './user.component.html',
  styleUrl: './user.component.css'
})
export class UserComponent {

  //#region VARIABLES

  private _appMain: string = environment.appMain;

  hidePwd: boolean = true;
  hidePwd2: boolean = true;
  hidePwd3: boolean = true;

  title: string = 'Usuario';
  bShowSpinner: boolean = false;
  idUser: number = 0;

  rolesByUserList: any[] = [];

  public showPwd2: boolean = false;

  userForm: any = {
    idUser: 0,
    name: '',
    userName: '',
    pwd: '',
    idStatus: 0,
    active: true
  };

  addRoleForm: any = {
    idUser: 0,
    idRol: 0,
    text: ''
  };

  changePwdForm: FormGroup;

  //#end region

  constructor(
    private fb: FormBuilder
    , private dialogRef: MatDialogRef<UserComponent>
    , @Inject(MAT_DIALOG_DATA) public OData: any

    //, private activatedRoute: ActivatedRoute

    , private servicesGServ: ServicesGService
    , private _adapter: DateAdapter<any>
    , @Inject(MAT_DATE_LOCALE) private _locale: string
    , private usersServ: UsersService
    , private rolesServ: RolesService
    //, private actionsServ: ActionsService

    , private authServ: AuthService
  ) {
    this.changePwdForm = this.fb.group({
      idUser: [0, [Validators.required, Validators.pattern(/^[1-9]\d*$/)]],
      pwd: ['', Validators.compose([
        Validators.required,
        Validators.minLength(6),
        Validators.pattern(/(?=.*[0-9])/),
        Validators.pattern(/(?=.*[A-Z])/),
        Validators.pattern(/(?=.*[a-z])/),
        Validators.pattern(/(?=.*[-_.,$@^!%*?&])/),
        Validators.pattern(/^\S+$/)
        // No debe contener espacios
      ])],
      pwd2: ['', Validators.compose([
        Validators.required,
        Validators.minLength(6),
        Validators.pattern(/(?=.*[0-9])/),
        Validators.pattern(/(?=.*[A-Z])/),
        Validators.pattern(/(?=.*[a-z])/),
        Validators.pattern(/(?=.*[-_.,$@^!%*?&])/),
        Validators.pattern(/^\S+$/)
        // No debe contener espacios
      ])]
    });

  }

  ngOnInit(): void {
    this.authServ.checkSession();

    this._locale = 'mx';
    this._adapter.setLocale(this._locale);

    if (this.OData.id > 0) {

      this.bShowSpinner = true;

      this.usersServ.CGetUserByID(this.OData.id)
        .subscribe((resp: any) => {

          if (resp.status == 0) {

            this.idUser = resp.data.idUser;

            this.userForm.idUser = resp.data.idUser;
            this.addRoleForm.idUser = resp.data.idUser;
            this.changePwdForm.get('idUser')?.setValue(resp.data.idUser);

            this.userForm = {
              idUser: resp.data.idUser,
              name: resp.data.name,
              userName: resp.data.userName,
              pwd: '',
              idStatus: resp.data.idStatus,
              active: resp.data.active
            };

            this.fn_getRolesByIdUser();

          } else {
            this.servicesGServ.showSnakbar(resp.message);
          }
          this.bShowSpinner = false;
        });

    }

  }

  //#region METODOS DE FRONT

  validateUserForm(): boolean {
    const { name, userName, pwd } = this.userForm;

    // Verificar que el nombre esté lleno
    if (!name || name.trim().length === 0) {
      return false;
    }

    // Verificar que el userName esté lleno
    if (!userName || userName.trim().length === 0) {
      return false;
    }

    // Verificar que el userName no tenga espacios
    if (/\s/.test(userName)) {
      return false;
    }

    // Si es un nuevo usuario, validar la contraseña
    if (this.idUser == 0) {
      if (!pwd || pwd.trim().length === 0) {
        return false;
      }

      // Validar que la contraseña cumpla con los requisitos
      if (!this.validatePassword(pwd)) {
        return false;
      }
    }

    // Si todas las validaciones pasaron
    return true;
  }

  // Método para validar la contraseña
  validatePassword(password: string): boolean {
    if (!password || password.length < 6) {
      return false;
    }

    // Verificar requisitos mínimos
    const hasNumber = /(?=.*\d)/.test(password);
    const hasUpper = /(?=.*[A-Z])/.test(password);
    const hasLower = /(?=.*[a-z])/.test(password);
    const hasSpecial = /(?=.*[-_.,$@^!%*?&])/.test(password);
    const hasNoSpaces = !/\s/.test(password);

    return hasNumber && hasUpper && hasLower && hasSpecial && hasNoSpaces;
  }

  close() {
    this.dialogRef.close(true);
  }

  //#end region

  //#region CONEXIONES CON EL BACK

  fn_changePassword() {

    this.servicesGServ.showDialog('¿Estás seguro?'
      , 'Está a punto de cambiar la contraseña'
      , '¿Desea continuar?'
      , 'Si', 'No')
      .afterClosed().subscribe({
        next: (resp) => {
          if (resp) {

            this.bShowSpinner = true;
            this.usersServ.CChangePassword(this.changePwdForm.value)
              .subscribe({
                next: (resp: ResponseDB_CRUD) => {

                  if (resp.status === 0) {
                    this.changePwdForm.get('pwd')?.setValue('');
                    this.changePwdForm.get('pwd2')?.setValue('');
                  }

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



  fn_getRolesByIdUser() {

    this.rolesServ.CGetRolesByIdUser(this.idUser)
      .subscribe({
        next: (resp: ResponseGet) => {

          if (resp.status === 0) {
            this.rolesByUserList = resp.data;
          } else {
            this.rolesByUserList = [];
          }

        },
        error: (ex) => {
          this.servicesGServ.showSnakbar("Problemas con el servicio");
        }

      })

  }

  fn_insertRolByIdUser() {

    this.servicesGServ
      .showDialog('¿Estás seguro?'
        , 'Está a punto de asignar este rol'
        , '¿Desea continuar?'
        , 'Si', 'No')
      .afterClosed().subscribe({
        next: (resp: any) => {
          if (resp) {

            this.bShowSpinner = true;

            this.rolesServ.CInsertRolByIdUser(this.addRoleForm)
              .subscribe({
                next: (resp: ResponseDB_CRUD) => {

                  this.servicesGServ.showAlertIA(resp);
                  this.bShowSpinner = false;

                  this.addRoleForm.idRol = 0;
                  this.addRoleForm.text = '';

                  this.fn_getRolesByIdUser();

                },
                error: (ex) => {
                  this.servicesGServ.showSnakbar("Problemas con el servicio");
                  this.bShowSpinner = false;
                }
              })
          }
        }
      });

  }

  fn_deleteRolByIdUser(idRol: number) {

    this.servicesGServ.showDialog('¿Estás seguro?'
      , 'Está a punto de borrar la asignación del rol'
      , '¿Desea continuar?'
      , 'Si', 'No')
      .afterClosed().subscribe({
        next: (resp: any) => {
          if (resp) {

            this.bShowSpinner = true;
            this.rolesServ.CDeleteRolByIdUser(this.idUser, idRol)
              .subscribe({
                next: (resp: ResponseDB_CRUD) => {

                  this.fn_getRolesByIdUser();

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

  fn_saveUser() {

    this.bShowSpinner = true;

    if (this.idUser > 0) {
      this.usersServ.CUpdateUser(this.userForm)
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
      this.usersServ.CInsertUser(this.userForm)
        .subscribe({
          next: (resp: ResponseDB_CRUD) => {

            if (resp.status === 0) {

              this.idUser = resp.insertID;

              this.userForm.idUser = resp.insertID;
              this.addRoleForm.idUser = resp.insertID;
              this.changePwdForm.get('idUser')?.setValue(resp.insertID);

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

  //#region COMBO BOXES

  //--------------------------------------------------------------------------
  // MÉTODOS PARA COMBO DE ROLES

  cbxRoles: any[] = [];

  cbxSearchRol() {
    this.rolesServ.CGetRolesForAddUser(this.addRoleForm)
      .subscribe({
        next: (resp: ResponseGet) => {
          if (resp.status === 0) {
            this.cbxRoles = resp.data
          }
          else {
            this.cbxRoles = [];
          }
        },
        error: (ex) => {
          this.servicesGServ.showSnakbar("Problemas con el servicio");
          this.bShowSpinner = false;
        }
      });
  }

  cbxSelectedOptionRol(event: MatAutocompleteSelectedEvent) {

    if (!event.option.value) {
      return;
    }

    const ODataCbx: any = event.option.value;

    this.addRoleForm.idRol = ODataCbx.id;
    this.addRoleForm.text = ODataCbx.text;

  }

  cbxRolClear() {
    this.addRoleForm.idRol = 0;
    this.addRoleForm.text = '';
  }
  //--------------------------------------------------------------------------

  //#end region

}
