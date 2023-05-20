import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FeeCollectionRoutingModule } from './fee-collection-routing.module';
import { FeeCollectionComponent } from './fee-collection.component';
import { CoreModule } from '../core/core.module';
import { FeeDueComponent } from './fee-due/fee-due.component';
import { FeePaymentComponent } from './fee-payment/fee-payment.component';
import { FeeReceiptComponent } from './fee-receipt/fee-receipt.component';


@NgModule({
  declarations: [
    FeeCollectionComponent,
    FeeDueComponent,
    FeePaymentComponent,
    FeeReceiptComponent
  ],
  imports: [
    CommonModule,
    FeeCollectionRoutingModule,
    CoreModule
  ]
})
export class FeeCollectionModule { }
