import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { StudentFeeComponent } from 'src/app/student/student-fee/student-fee.component';
import { StudentFeeService } from 'src/app/student/student-fee/student-fee.service';
import { FeeReceiptComponent } from '../fee-receipt/fee-receipt.component';

@Component({
  selector: 'app-fee-payment',
  templateUrl: './fee-payment.component.html',
  styleUrls: ['./fee-payment.component.css']
})
export class FeePaymentComponent {
  filter: any;
  entitys = [];
  entitysFilter = [];
  displayedColumns: string[] = ['name', 'joiningDate', 'batch', 'feeAmount', 'paymentAmount', 'paymentDate', 'action'];
  selectedRow: any;
  fromUIDate: Date = new Date();
  toUIDate: Date = new Date();
  constructor(private toastr: ToastrService, private studentFeeService: StudentFeeService, private dialog: MatDialog
    ) {}
    ngOnInit() {
      this.fromUIDate.setDate(this.fromUIDate.getDate() - 1);
      this.getData();
    }
  getData(){
    this.studentFeeService.getPayments(this.fromUIDate, this.toUIDate)
    .subscribe((data)=>{
      this.entitys = data;
    },
    (error)=>{
    });
  }
  search() {
    this.getData();
  }
  highlight(row: any){
    // this.selectedRow = row;
  }
  payment(data: any) {
    const dialogRef = this.dialog.open(StudentFeeComponent, {
      data: {selectedRow: data, month: data.monthName},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
  receipt(data: any): void {
    const dialogRef = this.dialog.open(FeeReceiptComponent, {
      data: {selectedRow: data, month: data.monthName},
      width: '600px',
      height: '600px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
}
