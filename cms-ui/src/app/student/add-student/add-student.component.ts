import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { StudentService } from '../student.service';
import { BatchService } from 'src/app/batch/batch.service';

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.css']
})
export class AddStudentComponent {
  form!: FormGroup;
  batchs: any = [];
  entity: any;
  constructor(private toastr: ToastrService, private studentService: StudentService,
    private dialogRef: MatDialogRef<AddStudentComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private fb: FormBuilder,
    private batchService: BatchService) {}
  ngOnInit() {
    this.getBatchs();
    this.getData();
    this.setForm();
  }
  save() {
    if(this.data?.selectedRow?.id != null) { 
      this.studentService.put(this.form.value, this.data.selectedRow.id)
        .subscribe((data)=>{
          this.toastr.success('Student Save Sucessfully!', 'Student');          
          this.clear();
          this.onNoClick();
        }, (error)=>{
        });
    } else {
      this.studentService.post(this.form.value)
        .subscribe((data)=>{
          this.toastr.success('Student Save Sucessfully!', 'Student');
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
      rollNumber: [null, [Validators.required]],
      firstName: [null, [Validators.required]],
      lastName: [null, [Validators.required]],
      middleName: [null],
      fatherName: [null],
      motherName: [null],
      phone: [null, [Validators.required]],
      parentPhone: [null],
      address: [null],
      city: [null],
      pinCode: [null],
      joiningDate: [new Date(), [Validators.required]],
      batchId: [null, [Validators.required]],
      board: [null, [Validators.required]]
    });
  }
  setFormData() {
    this.form.patchValue({
      rollNumber: this.entity.rollNumber,
      firstName: this.entity.firstName,
      lastName: this.entity.lastName,
      middleName: this.entity.middleName,
      fatherName: this.entity.fatherName,
      motherName: this.entity.motherName,
      phone: this.entity.phone,
      parentPhone: this.entity.parentPhone,
      address: this.entity.address,
      city: this.entity.city,
      pinCode: this.entity.pinCode,
      joiningDate: this.entity.joiningDate,
      batchId: this.entity.batchId,
      board: this.entity.board
    });
  }
  onNoClick() {
    this.dialogRef.close();
  }
  getData(){
    if(this.data?.selectedRow?.id) {
      this.studentService.getByid(this.data.selectedRow.id)
      .subscribe((data)=>{
        this.entity = data;
        this.setFormData();
      },
      (error)=>{
      });
    }
    
  }
  getBatchs(){
    this.batchService.get()
    .subscribe((data)=>{
      this.batchs = data;
    },
    (error)=>{
    });
  }
}
