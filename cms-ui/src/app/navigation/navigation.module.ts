import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NavigationRoutingModule } from './navigation-routing.module';
import { CoreModule } from '../core/core.module';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    NavigationRoutingModule,
    CoreModule
  ]
})
export class NavigationModule { }
