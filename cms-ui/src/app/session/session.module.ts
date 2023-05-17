import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SessionRoutingModule } from './session-routing.module';
import { SessionComponent } from './session.component';
import { AddSessionComponent } from './add-session/add-session.component';
import { SystemSettingComponent } from './system-setting/system-setting.component';
import { CoreModule } from '../core/core.module';


@NgModule({
  declarations: [
    SessionComponent,
    AddSessionComponent,
    SystemSettingComponent
  ],
  imports: [
    CommonModule,
    SessionRoutingModule,
    CoreModule
  ]
})
export class SessionModule { }
