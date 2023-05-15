import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { config } from '../core/config';

@Injectable({
  providedIn: 'root'
})
export class SessionService {

  constructor(private http: HttpClient) {
  }
  get(): Observable<any> {    
    return this.http.get(`${config.baseApiURL}v1/sessions`);
  }
  post(data: any): Observable<any> {    
    return this.http.post(`${config.baseApiURL}v1/sessions`, data);
  }
  put(data: any, id: any): Observable<any> {    
    return this.http.put(`${config.baseApiURL}v1/sessions/${id}`, data);
  }
}
