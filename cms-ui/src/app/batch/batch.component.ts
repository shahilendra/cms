import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { BatchService } from './batch.service';
import { AddBatchComponent } from './add-batch/add-batch.component';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-batch',
  templateUrl: './batch.component.html',
  styleUrls: ['./batch.component.css']
})
export class BatchComponent {
  entitys = [];
  displayedColumns: string[] = ['name', 'startTime','endTime', 'class', 'feeAmount'];
  selectedRow: any;
  constructor(private toastr: ToastrService, private batchService: BatchService, private dialog: MatDialog,) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.batchService.get()
    .subscribe((data)=>{
      this.entitys = data;
    },
    (error)=>{
    });
  }

  highlight(row: any){
    this.selectedRow = row;
  }
  updateBatch() {
    const dialogRef = this.dialog.open(AddBatchComponent, {
      data: {selectedRow: this.selectedRow},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
  addBatch() {
    const dialogRef = this.dialog.open(AddBatchComponent, {
      data: {selectedRow: null},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
}
