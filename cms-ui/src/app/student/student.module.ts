import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StudentRoutingModule } from './student-routing.module';
import { StudentComponent } from './student.component';
import { AddStudentComponent } from './add-student/add-student.component';
import { CoreModule } from '../core/core.module';
import { StudentFeeComponent } from './student-fee/student-fee.component';;

@NgModule({
  declarations: [
    StudentComponent,
    AddStudentComponent,
    StudentFeeComponent,
  ],
  imports: [
    CommonModule,
    StudentRoutingModule,
    CoreModule
  ]
})
export class StudentModule { }
