import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { SessionService } from './session.service';
import { AddSessionComponent } from './add-session/add-session.component';
import { SystemSettingComponent } from './system-setting/system-setting.component';

@Component({
  selector: 'app-session',
  templateUrl: './session.component.html',
  styleUrls: ['./session.component.css']
})
export class SessionComponent {
  entitys = [];
  displayedColumns: string[] = ['name', 'startDate','endDate'];
  selectedRow: any;
  constructor(private toastr: ToastrService, private sessionService: SessionService, private dialog: MatDialog,) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.sessionService.get()
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
    const dialogRef = this.dialog.open(AddSessionComponent, {
      data: {selectedRow: this.selectedRow},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
  add() {
    const dialogRef = this.dialog.open(AddSessionComponent, {
      data: {selectedRow: null},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getData();
    });
  }
  systemSettings() {
    const dialogRef = this.dialog.open(SystemSettingComponent, {
      data: {selectedRow: null},
      width: '800px',
      height: '800px'
    });
    dialogRef.afterClosed().subscribe(result => {
      
    });
  }
}
