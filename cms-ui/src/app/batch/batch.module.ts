import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BatchRoutingModule } from './batch-routing.module';
import { BatchComponent } from './batch.component';
import { AddBatchComponent } from './add-batch/add-batch.component';
import { CoreModule } from '../core/core.module';

@NgModule({
  declarations: [
    BatchComponent,
    AddBatchComponent
  ],
  imports: [
    CommonModule,
    BatchRoutingModule,
    CoreModule
  ]
})
export class BatchModule { }
