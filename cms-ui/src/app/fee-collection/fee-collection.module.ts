import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FeeCollectionRoutingModule } from './fee-collection-routing.module';
import { FeeCollectionComponent } from './fee-collection.component';
import { CoreModule } from '../core/core.module';
import { FeeDueComponent } from './fee-due/fee-due.component';


@NgModule({
  declarations: [
    FeeCollectionComponent,
    FeeDueComponent
  ],
  imports: [
    CommonModule,
    FeeCollectionRoutingModule,
    CoreModule
  ]
})
export class FeeCollectionModule { }
