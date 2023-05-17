import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { StudentService } from '../student/student.service';
import { MatDialog } from '@angular/material/dialog';
import { StudentFeeComponent } from '../student/student-fee/student-fee.component';
import { StudentFeeService } from '../student/student-fee/student-fee.service';

@Component({
  selector: 'app-fee-collection',
  templateUrl: './fee-collection.component.html',
  styleUrls: ['./fee-collection.component.css']
})
export class FeeCollectionComponent {
  filter: any;
  entitys = [];
  entitysFilter = [];
  displayedColumns: string[] = ['name', 'joiningDate', 'April',
   'May', 'June', 'July', 'August', 'September','October','November', 'December','January', 'February', 'March', 'totalAmont'];
  selectedRow: any;
  constructor(private toastr: ToastrService, private studentFeeService: StudentFeeService, private dialog: MatDialog
    ) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.studentFeeService.get()
    .subscribe((data)=>{
      this.entitys = data;
    },
    (error)=>{
    });
  }

  highlight(row: any){
    // this.selectedRow = row;
  }
  payment(data: any, month: string) {
    const dialogRef = this.dialog.open(StudentFeeComponent, {
      data: {selectedRow: data, month: month},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
}
