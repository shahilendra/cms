import { Component } from '@angular/core';
import { map } from 'rxjs/operators';
import { Breakpoints, BreakpointObserver } from '@angular/cdk/layout';
import { ChartOptions, ChartType } from 'chart.js';
import { StudentFeeService } from '../student/student-fee/student-fee.service';
//import { Label } from 'ng2-charts';

@Component({
  selector: 'app-admin-dashboard',
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css']
})
export class AdminDashboardComponent {
   barChartOptions: ChartOptions = {
    responsive: true,
  };
  barChartLabels: any[] = [];
  barChartLegend = true;
  barChartPlugins = [];
  barChartData: any[] = [
    { data: [], label: 'Fee Collection' }
  ];

  barChartLabelsDaily: any[] = []; 
  barChartDataDaily: any[] = [
    { data: [], label: 'Fee Collection' }
  ];
  constructor(private studentFeeService: StudentFeeService
    ) {}
    ngOnInit() {
      this.getData();
    }
  getData(){
    this.studentFeeService.getDailyFee()
    .subscribe((data)=>{
      for(let index =0; index<data.length; index++) {
        this.barChartDataDaily[0].data.push(data[index].Total);
        this.barChartLabelsDaily.push(data[index].Date)
      }
    },
    (error)=>{
    });
    this.studentFeeService.getMonthlyFee()
    .subscribe((data)=>{
      for(let index =0; index<data.length; index++) {
        this.barChartData[0].data.push(data[index].Total);
        this.barChartLabels.push(data[index].paymentMonth)
      }
      console.log(this.barChartLabels);
    },
    (error)=>{
    });
  }
}
