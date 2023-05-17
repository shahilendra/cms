import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { StudentFeeComponent } from 'src/app/student/student-fee/student-fee.component';
import { StudentFeeService } from 'src/app/student/student-fee/student-fee.service';

@Component({
  selector: 'app-fee-due',
  templateUrl: './fee-due.component.html',
  styleUrls: ['./fee-due.component.css']
})
export class FeeDueComponent {
  filter: any;
  entitys = [];
  entitysFilter = [];
  displayedColumns: string[] = ['name', 'joiningDate', 'monthName', 'feeAmount', 'payment'];
  selectedRow: any;
  dateToday: Date = new Date();
  constructor(private toastr: ToastrService, private studentFeeService: StudentFeeService, private dialog: MatDialog
    ) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.studentFeeService.getDueFee(this.dateToday)
    .subscribe((data)=>{
      this.entitys = data;
    },
    (error)=>{
    });
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
}
