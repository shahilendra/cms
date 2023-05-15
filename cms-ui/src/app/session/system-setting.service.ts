import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { config } from '../core/config';

@Injectable({
  providedIn: 'root'
})
export class SystemSettingService {

  constructor(private http: HttpClient) {
  }
  get(): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/system-settings`);
  }
  post(data: any): Observable<any> {    
    return this.http.post(`${config.baseApiURL}v1/system-settings`, data);
  }
  put(data: any, id: any): Observable<any> {    
    return this.http.put(`${config.baseApiURL}v1/system-settings/${id}`, data);
  }
}
