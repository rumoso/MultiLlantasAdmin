import { Component, inject, ViewChild, ChangeDetectorRef } from '@angular/core';
import { SharedModule } from '../../../shared/Shared.module';
import { MaterialModule } from '../../../shared/material.module';
import { environment } from '../../../../environments/environment';
import { ServicesGService } from '../../../servicesG/servicesG.service';
import { AuthService } from '../../../auth/services/auth.service';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ProductosService } from '../../services/product.service';
import { Pagination } from '../../interfaces/global.interfaces';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css'],
  imports: [
    SharedModule,
    MaterialModule,
  ]
})
export default class DashboardComponent {

  private _appMain: string = environment.appMain;
  dialog = inject(MatDialog);
  snackBar = inject(MatSnackBar);
  cdr = inject(ChangeDetectorRef);
  _menuList: any = [];
  idUserLogON: number = 0;
  hayTurnoActivo: boolean = false;
  hayCorteGeneralActivo: boolean = false;
  validacionesCompletas: boolean = false;

  constructor(
    private servicesGServ: ServicesGService
    , private authServ: AuthService
  ) { }

  async ngOnInit() {
    this.authServ.checkSession();
    this.idUserLogON = this.authServ.getIdUserSession();

    this.getMenuByPermissions(this.idUserLogON);

    // Primero obtener la configuración local y información de sucursal
    this.cdr.detectChanges();
  }

  changeRoute(route: string): void {
    // Rutas que requieren turno activo
    const rutasRestringidas = ['cajaPuntoVenta', 'ventaClientes', 'cobranzaCredito', 'corteIndividual'];

    // Verificar si la ruta requiere turno activo
    if (rutasRestringidas.includes(route)) {
      if (!this.hayTurnoActivo) {
        // Mostrar modal indicando que es necesario iniciar turno
        this.servicesGServ.showAlert(
          'W',
          'Turno Requerido',
          'Es necesario iniciar un turno para acceder a esta función.'
        );
        return; // No navegar
      }
    }

    // Verificar si la ruta requiere corte general activo
    if (route === 'corteGeneral') {
      if (!this.hayCorteGeneralActivo) {
        // Mostrar modal indicando que es necesario iniciar la jornada
        this.servicesGServ.showAlert(
          'W',
          'Jornada Requerida',
          'Es necesario iniciar la jornada para acceder a esta función.'
        );
        return; // No navegar
      }
    }

    // Navegar normalmente si no hay restricciones o si hay turno activo
    this.servicesGServ.changeRoute(`/${this._appMain}/${route}`);
  }

  getMenuByPermissions(idUser: any) {
    this.authServ.getMenuByPermissions(idUser)
      .subscribe(data => {
        //console.log(data);
        if (data.status == 0) {
          this._menuList = data.data;

          // Manually add Catalog if not present (Quick fix for user request)
          const catalogExists = this._menuList.some((m: any) => m.name === 'Catálogo');
          if (!catalogExists) {
            this._menuList.push({
              idMenu: 999,
              name: 'Catálogo',
              icon: 'inventory_2',
              subMenus: [
                {
                  idMenu: 9991,
                  name: 'Productos',
                  description: 'Catálogo de productos de venta',
                  imgDash: 'inventory',
                  linkList: 'productList'
                }
              ]
            });
          }

          // Optional: if you want the first panel open by default with mat-accordion,
          // you might need to handle it differently or set properties on mat-expansion-panel.
          // For single expansion, mat-accordion handles it.
        }
      })
  }

  /**
   * Verifica si un card del menú debe estar deshabilitado
   * @param linkList - El valor del atributo linkList del item del menú
   * @returns true si el card debe estar deshabilitado
   */
  isCardDisabled(linkList: string): boolean {
    const rutasRestringidas = ['cajaPuntoVenta', 'ventaClientes', 'cobranzaCredito', 'corteIndividual'];

    // Verificar rutas que requieren turno activo
    if (rutasRestringidas.includes(linkList) && !this.hayTurnoActivo) {
      return true;
    }

    // Verificar ruta que requiere corte general activo
    if (linkList === 'corteGeneral' && !this.hayCorteGeneralActivo) {
      return true;
    }

    return false;
  }

}
