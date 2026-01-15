import { ChangeDetectionStrategy, ChangeDetectorRef, Component, ElementRef, Inject, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

// Material & Shared
import { MaterialModule } from '../../../../../shared/material.module';
import { SharedModule } from '../../../../../shared/Shared.module';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

// Services & Interfaces
import { ServicesGService } from '../../../../../servicesG/servicesG.service';
import { ProductosService } from '../../../../services/product.service';
import { AuthService } from '../../../../../auth/services/auth.service';
import { AssetsService } from '../../../../services/assets.service';
import { Productos } from '../../../../interfaces/productos/productos';
import { ResponseDB_CRUD, ResponseGet } from '../../../../interfaces/global.interfaces';

@Component({
  selector: 'app-producto',
  standalone: true,
  imports: [CommonModule, SharedModule, MaterialModule, FormsModule],
  templateUrl: './product.component.html',
  styleUrl: './product.component.css',
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ProductComponent implements OnInit {
  @ViewChild('fileInput') fileInput!: ElementRef<HTMLInputElement>;

  // Estado del componente
  title: string = 'Producto';
  bShowSpinner: boolean = false;
  idUserLogON: number = 0;
  imagePreview: string | null = null;
  selectedFile: File | null = null;

  // Permisos
  prod_CrearEditarEliminar: boolean = false;

  producto: Productos = {
    idProducto: 0,
    nombre: '',
    descripcion: '',
    marca: '',
    modelo: '',
    ancho: '',
    perfil: '',
    rin: '',
    precio: 0,
    imagen_url: null,
    activo: true,
    createDate: new Date(),
  };

  constructor(
    private servicesGServ: ServicesGService,
    private dialogRef: MatDialogRef<ProductComponent>,
    private productoService: ProductosService,
    private assetsService: AssetsService,
    private authServ: AuthService,
    private cdref: ChangeDetectorRef,
    @Inject(MAT_DIALOG_DATA) public OData: any
  ) { }

  async ngOnInit() {
    try {
      this.authServ.checkSession();
      this.title = this.OData.title || this.title;
      this.idUserLogON = await this.authServ.getIdUserSession();

      // Carga de Permisos
      // const oActions = await this.authServ.CGetActionsPermissionPromise(this.idUserLogON);
      // this.prod_CrearEditarEliminar = oActions?.some((a: any) => a.name === 'prod_CrearEditarEliminar');
      this.prod_CrearEditarEliminar = true;
      if (this.OData.id > 0) {
        this.ObtenerProductoByID(this.OData.id);
      }
    } catch (error) {
      console.error("Error en OnInit:", error);
    }
  }

  ProductoSave() {
    if (this.bShowSpinner || !this.prod_CrearEditarEliminar) return;

    if (!this.producto.nombre || !this.producto.precio) {
      this.servicesGServ.showSnakbar("Nombre y Precio son requeridos");
      return;
    }

    this.bShowSpinner = true;

    const formData = new FormData();
    if (this.selectedFile) formData.append('image', this.selectedFile);
    formData.append('producto', JSON.stringify(this.producto));

    this.productoService.GuardarProducto(formData).subscribe({
      next: (resp: ResponseDB_CRUD) => {
        this.servicesGServ.showAlertIA(resp);
        this.bShowSpinner = false;
        if (resp.status === 0) this.dialogRef.close(true);
        this.cdref.detectChanges();
      },
      error: () => {
        this.servicesGServ.showSnakbar("Error al guardar el producto");
        this.bShowSpinner = false;
        this.cdref.detectChanges();
      }
    });
  }

  ObtenerProductoByID(id: number) {
    this.bShowSpinner = true;
    this.productoService.CGetProductoByID({ idProducto: id }).subscribe({
      next: (resp: any) => {
        if (resp.status === 0 && resp.data) {
          const d = resp.data;
          this.producto = {
            idProducto: d.idProducto || d.id_producto || 0,
            nombre: d.nombre || '',
            descripcion: d.descripcion || '',
            marca: d.marca || '',
            modelo: d.modelo || '',
            ancho: d.ancho || '',
            perfil: d.perfil || '',
            rin: d.rin || '',
            precio: d.precio ? parseFloat(d.precio) : 0,
            imagen_url: d.imagen_url || '',
            activo: d.activo == 1,
            createDate: d.createDate ? new Date(d.createDate) : new Date()
          };

          if (this.producto.imagen_url) {
            this.imagePreview = this.assetsService.getImageProductByName(this.producto.imagen_url);
          }
        }
        this.bShowSpinner = false;
        this.cdref.detectChanges();
      },
      error: (err) => {
        this.bShowSpinner = false;
        this.servicesGServ.showSnakbar("Error al obtener producto");
        this.cdref.detectChanges();
      }
    });
  }

  // --- Helpers de UI ---
  onFileSelected(event: any) {
    const file = event.target.files[0];
    if (file && file.type.startsWith('image/')) {
      this.selectedFile = file;
      const reader = new FileReader();
      reader.onload = () => {
        this.imagePreview = reader.result as string;
        this.cdref.detectChanges();
      };
      reader.readAsDataURL(file);
    }
  }

  removeImage() {
    this.imagePreview = null;
    this.selectedFile = null;
    this.producto.imagen_url = null;
    if (this.fileInput) this.fileInput.nativeElement.value = '';
    this.cdref.detectChanges();
  }

  close() { this.dialogRef.close(false); }
}
