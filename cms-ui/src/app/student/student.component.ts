import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { StudentService } from './student.service';
import { AddStudentComponent } from './add-student/add-student.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.css']
})
export class StudentComponent {
  entitys = [];
  displayedColumns: string[] = ['rollNumber', 'name', 'phone', 'joiningDate', 'batch', 'class', 'board','fatherName', 'motherName', 'address'];
  selectedRow: any;
  constructor(private toastr: ToastrService, private studentService: StudentService, private dialog: MatDialog,) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.studentService.get()
    .subscribe((data)=>{
      this.entitys = data;
    },
    (error)=>{
    });
  }

  highlight(row: any){
    this.selectedRow = row;
  }
  update() {
    const dialogRef = this.dialog.open(AddStudentComponent, {
      data: {selectedRow: this.selectedRow},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
  add() {
    const dialogRef = this.dialog.open(AddStudentComponent, {
      data: {selectedRow: null},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
}
