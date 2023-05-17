import { Component, Inject} from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { BatchService } from '../batch.service';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-add-batch',
  templateUrl: './add-batch.component.html',
  styleUrls: ['./add-batch.component.css']
})
export class AddBatchComponent {
  form!: FormGroup;
  constructor(private toastr: ToastrService, private batchService: BatchService,
    private dialogRef: MatDialogRef<AddBatchComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder) {}
  ngOnInit() {
    this.setForm();
  }
  save() {
    if(this.data.selectedRow != null) { 
      this.batchService.put(this.form.value, this.data.selectedRow.id)
        .subscribe((data)=>{
          this.toastr.success('Batch Save Sucessfully!', 'Batch');          
          this.clear();
          this.onNoClick();
        }, (error)=>{
        });
    } else {
      this.batchService.post(this.form.value)
        .subscribe((data)=>{
          this.toastr.success('Batch Save Sucessfully!', 'Batch');
          this.clear();
          this.onNoClick();
        }, (error)=>{
        });
    }
    
  }
  clear() {
    this.form.patchValue({
      startTime: null,
      entTime: new Date(),
      name: null,
      class: null,
      feeAmount: null
    });
  }
  setForm() {
    this.form = this.fb.group({
      startTime: [this.data.selectedRow?.startTime, [Validators.required]],
      endTime: [this.data.selectedRow?.endTime, [Validators.required]],
      name: [this.data.selectedRow?.name, [Validators.required]],
      class: [this.data.selectedRow?.class, [Validators.required]],
      feeAmount: [this.data.selectedRow?.feeAmount, [Validators.required]]
    });
  }
  onNoClick() {
    this.dialogRef.close();
  }
}
