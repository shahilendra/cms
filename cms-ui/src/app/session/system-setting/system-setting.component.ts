import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { SystemSettingService } from '../system-setting.service';
import { MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SessionService } from '../session.service';

@Component({
  selector: 'app-system-setting',
  templateUrl: './system-setting.component.html',
  styleUrls: ['./system-setting.component.css']
})
export class SystemSettingComponent {
  form!: FormGroup;
  entity: any;
  sesions: any = [];
  constructor(private toastr: ToastrService, private systemSettingService: SystemSettingService,
    private dialogRef: MatDialogRef<SystemSettingComponent>,
    private fb: FormBuilder, private sessionService: SessionService) {}
  ngOnInit() {
    this.setForm();
    this.getSession();
    this.getData();
  }
  getData(){
    this.systemSettingService.get()
    .subscribe((data)=>{
      this.entity = data;
      this.SetForm();
    },
    (error)=>{
    });
  }
  getSession(){
    this.sessionService.get()
    .subscribe((data)=>{
      this.sesions = data;
    },
    (error)=>{
    });
  }
  save() {
    if(this.entity?.id != null) { 
      this.systemSettingService.put(this.form.value, this.entity.id)
        .subscribe((data)=>{
          this.toastr.success('System Settings Save Sucessfully!', 'System Settings');          
          this.onNoClick();
        }, (error)=>{
        });
    } else {
      this.systemSettingService.post(this.form.value)
        .subscribe((data)=>{
          this.toastr.success('System Settings Save Sucessfully!', 'System Settings');
          this.onNoClick();
        }, (error)=>{
        });
    }
    
  }
  SetForm() {
    this.form.patchValue({
      sessionId: this.entity?.sessionId,
      email: this.entity?.email
    });
  }
  setForm() {
    this.form = this.fb.group({
      sessionId: [null, [Validators.required]],
      email: [null, [Validators.required]]
    });
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
