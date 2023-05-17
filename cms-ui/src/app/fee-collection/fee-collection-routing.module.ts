import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FeeCollectionComponent } from './fee-collection.component';
import { FeeDueComponent } from './fee-due/fee-due.component';

const routes: Routes = [{
  path:'',
  component: FeeCollectionComponent
}, {
  path: 'due',
  component: FeeDueComponent
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FeeCollectionRoutingModule { }
