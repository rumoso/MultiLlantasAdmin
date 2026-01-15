import { Routes } from "@angular/router";


export const routes: Routes = [
  {
    path: '',
    loadComponent: () => import('./pages/main/main.component'),
    children: [
      {
        path: 'dashboard',
        loadComponent: () => import('./pages/dashboard/dashboard.component'),
      },
      {
        path: 'productList',
        loadComponent: () => import('./pages/catalog/product-list/product-list.component').then(m => m.ProductListComponent),
      },
      {
        path: 'userList',
        loadComponent: () => import('./pages/security/user-list/user-list.component'),
      },
      {
        path: 'roleList',
        loadComponent: () => import('./pages/security/role-list/role-list.component'),
      }
    ]
  }
]
