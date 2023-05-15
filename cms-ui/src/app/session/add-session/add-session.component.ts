import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { SessionService } from '../session.service';

@Component({
  selector: 'app-add-session',
  templateUrl: './add-session.component.html',
  styleUrls: ['./add-session.component.css']
})
export class AddSessionComponent {
  form!: FormGroup;
  constructor(private toastr: ToastrService, private sessionService: SessionService,
    private dialogRef: MatDialogRef<AddSessionComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder) {}
  ngOnInit() {
    this.setForm();
  }
  save() {
    if(this.data.selectedRow != null) { 
      this.sessionService.put(this.form.value, this.data.selectedRow.id)
        .subscribe((data)=>{
          this.toastr.success('Session Save Sucessfully!', 'Session');          
          this.clear();
          this.onNoClick();
        }, (error)=>{
        });
    } else {
      this.sessionService.post(this.form.value)
        .subscribe((data)=>{
          this.toastr.success('Session Save Sucessfully!', 'Session');
          this.clear();
          this.onNoClick();
        }, (error)=>{
        });
    }
    
  }
  clear() {
    this.form.patchValue({
      startDate: null,
      endDate: new Date(),
      name: null,
    });
  }
  setForm() {
    this.form = this.fb.group({
      startDate: [this.data.selectedRow?.startDate?? new Date(), [Validators.required]],
      endDate: [this.data.selectedRow?.endDate?? new Date(), [Validators.required]],
      name: [this.data.selectedRow?.name, [Validators.required]]
    });
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
