import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NavigationComponent } from './navigation.component';
import { AdminDashboardComponent } from '../admin-dashboard/admin-dashboard.component';


const routes: Routes = [{
  path: '',
  component: NavigationComponent,
  children: [{
    path: '',
    component: AdminDashboardComponent  
  }, {
    path: 'master',
    loadChildren: () => import('../master/master.module').then(m => m.MasterModule)
  }, {
    path: 'batchs',
    loadChildren: () => import('../batch/batch.module').then(m => m.BatchModule)
  }, {
    path: 'sessions',
    loadChildren: () => import('../session/session.module').then(m => m.SessionModule)
  }, {
    path: 'students',
    loadChildren: () => import('../student/student.module').then(m => m.StudentModule)
  }
]
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class NavigationRoutingModule { }
