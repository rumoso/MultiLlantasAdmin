import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { HttpClient, HttpParams } from '@angular/common/http';
import { AuthService } from '../../auth/services/auth.service';
import { ResponseGet } from '../interfaces/global.interfaces';

@Injectable({
  providedIn: 'root'
})
export class AssetsService {

  private baseURL: string = environment.baseUrl;
  _api: string = 'api/assets';

  constructor(private http: HttpClient, private authServ: AuthService) { }

  getImageProductByName(imageFileName: string): string {
    if (!imageFileName) {
      return 'assets/images/no-image.png';
    }
    // Since images are saved in public/img/productos
    // and public is the static folder, we access it directly
    return `${this.baseURL}/${imageFileName}`;
  }

}
