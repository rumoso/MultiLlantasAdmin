import { ChangeDetectorRef, Component, inject, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { environment } from '../../../../environments/environment';
import { AuthService } from '../../../auth/services/auth.service';
import { ServicesGService } from '../../../servicesG/servicesG.service';
import { SharedModule } from '../../../shared/Shared.module';
import { MaterialModule } from '../../../shared/material.module';
import { Subscription } from 'rxjs';
import { CajaInfoService } from '../../../shared/services/caja-info.service';
import { HttpErrorResponse } from '@angular/common/http';
import { ResponseGet } from '../../interfaces/global.interfaces';
import { FormsModule } from '@angular/forms';
import { MatSidenav } from '@angular/material/sidenav';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css'],
  imports: [
    SharedModule,
    MaterialModule,
    FormsModule
  ]
})
export default class MainComponent implements OnInit {

  private _appMain: string = environment.appMain;
  public _IconApp: string = environment.iconApp;
  public _appName: string = environment.appName;
  public _cajaInfo: any = null;
  private cdref = inject(ChangeDetectorRef);
  private cajaInfoService = inject(CajaInfoService);
  private cajaInfoSubscription!: Subscription;

  @ViewChild('sidenav') sidenav!: MatSidenav;

  public configLocal: any = {};

  constructor(
    private authService: AuthService,
    private servicesGServ: ServicesGService
  ) { }

  get userLogin() {
    return this.authService.userLogin;
  }

  _userLogin: any;
  _menuList: any = [];

  MenusList: any[] = [];
  nombreCaja: string = '';

  async ngOnInit() {
    this.authService.checkSession();

    var idUserLogOn = localStorage.getItem('idUser');
    if (!(idUserLogOn?.length! > 0)) {
      this.servicesGServ.changeRoute('/');
    }

    await this.getMenuByPermissions(idUserLogOn);
  }

  changeRoute(route: string): void {
    this.sidenav.toggle();
    this.servicesGServ.changeRoute(`/${this._appMain}/${route}`);
  }

  logout() {
    this.authService.logout(true);
  }

  getMenuByPermissions(idUser: any) {
    this.authService.getMenuByPermissions(idUser)
      .subscribe(data => {
        if (data.status == 0) {
          this._menuList = data.data;

          // Manually add Catalog if not present (mirroring dashboard change)
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
        }
      });
  }

}
