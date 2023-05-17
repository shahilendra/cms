import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { StudentService } from '../student.service';
import { StudentFeeService } from './student-fee.service';

@Component({
  selector: 'app-student-fee',
  templateUrl: './student-fee.component.html',
  styleUrls: ['./student-fee.component.css']
})
export class StudentFeeComponent {
  form!: FormGroup;
  batchs: any = [];
  entity: any;
  paymentModes: any = ['Offline', 'Online']
  constructor(private toastr: ToastrService,
    private dialogRef: MatDialogRef<StudentFeeComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder,
    private studentFeeService: StudentFeeService) {}
  ngOnInit() {
    this.setForm();
  }
  save() {
      this.studentFeeService.post(this.form.value)
        .subscribe((data)=>{
          this.toastr.success('Student Fee Save Sucessfully!', 'Student');
          this.onNoClick();
        }, (error)=>{
        });
    // alert(JSON.stringify(this.form.value));
    
  }
  setForm() {
    this.form = this.fb.group({
      feeAmount: [this.data?.selectedRow?.feeAmount, [Validators.required]],
      discountAmount: [0, [Validators.required]],
      paymentDate: [new Date(), [Validators.required]],
      notes: [null],
      batchId: [this.data?.selectedRow?.batchId, [Validators.required]],
      sessionId: [this.data?.selectedRow?.sessionId, [Validators.required]],
      studentId: [this.data?.selectedRow?.id, [Validators.required]],
      receiptNo: [null, [Validators.required]],
      paymentMode: ['Offline', [Validators.required]],
      paymentMonth: [this.data?.month, [Validators.required]]
    });
  }
  onNoClick() {
    this.dialogRef.close();
  }
  getClass(item: any, month: any): string {
    let className = '';
    return className;
  }
}
