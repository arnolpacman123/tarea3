import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

import { Suma } from 'src/app/interfaces/suma';

@Injectable({
  providedIn: 'root',
})
export class SumaService {
  private baseUrl: string = 'https://api-suma.herokuapp.com/api/v1';
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    }),
  };

  constructor(private http: HttpClient) {}

  sumar(primerNumero: number, segundoNumero: number): Observable<Suma> {
    return this.http.post<Suma>(
      `${this.baseUrl}/suma`,
      { primerNumero: primerNumero, segundoNumero: segundoNumero },
      this.httpOptions
    );
  }
}
