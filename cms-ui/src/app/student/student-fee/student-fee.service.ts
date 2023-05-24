import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { config } from 'src/app/core/config';

@Injectable({
  providedIn: 'root'
})
export class StudentFeeService {

  constructor(private http: HttpClient) {
  }
  get(): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees`);
  }
  getByid(id: any): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/${id}`);
  }
  post(data: any): Observable<any> {    
    return this.http.post(`${config.baseApiURL}v1/student-fees`, data);
  }
  put(data: any, id: any): Observable<any> {    
    return this.http.put(`${config.baseApiURL}v1/student-fees/${id}`, data);
  }
  getDueFee(dateToday: any): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/due/fees?date=${this.formatDate(dateToday)}`);
  }
  getPayments(fromDate: any, toDate: any): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/fee/payments?fromDate=${this.formatDate(fromDate)}&toDate=${this.formatDate(toDate)}`);
  }
  getReceipt(data: any): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/fee/receipt?feeReceiptId=${data.feeReceiptId}&studentId=${data.studentId}&sessionId=${data.sessionId}&month=${data.month}`);
  }
  getDailyFee(): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/fee/daily-dashboard`);
  }
  getMonthlyFee(): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/student-fees/fee/monthly-dashboard`);
  }
  formatDate(date: Date) {
    return [
      date.getFullYear(),      
      this.padTo2Digits(date.getMonth() + 1),
      this.padTo2Digits(date.getDate())
    ].join('-');
  }
  padTo2Digits(num: number) {
    return num.toString().padStart(2, '0');
  }
}
