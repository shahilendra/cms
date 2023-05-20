import { Component, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { StudentFeeService } from 'src/app/student/student-fee/student-fee.service';

@Component({
  selector: 'app-fee-receipt',
  templateUrl: './fee-receipt.component.html',
  styleUrls: ['./fee-receipt.component.css']
})
export class FeeReceiptComponent {
  entities: any;
  constructor(private toastr: ToastrService,
    private dialogRef: MatDialogRef<FeeReceiptComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private studentFeeService: StudentFeeService) {}
  ngOnInit() {
    this.loadForm();
  }
  loadForm() {
    let data = {
      feeReceiptId: null,
      studentId: this.data?.selectedRow?.id,
      sessionId: this.data?.selectedRow?.sessionId,
      month: this.data?.month,
    };
    this.studentFeeService.getReceipt(data)
      .subscribe(data=>{
        this.entities = data;
      })
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
