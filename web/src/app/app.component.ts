import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';

import { SumaService } from 'src/app/services/suma.service';
import { NumerosRequest } from 'src/app/interfaces/numeros.request';
import { Suma } from 'src/app/interfaces/suma';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  form!: FormGroup;
  numerosRequest: NumerosRequest = {
    primerNumero: undefined,
    segundoNumero: undefined,
  };
  isLoading: boolean = false;
  suma?: Suma;

  constructor(private sumaService: SumaService) {}

  validate(): boolean {
    if (!isNaN(this.numerosRequest.primerNumero!) && !isNaN(this.numerosRequest.segundoNumero!))
      return true;
    return false;
  }

  sumar() {
    if (this.validate()) {
      this.isLoading = true;
      this.sumaService
        .sumar(
          this.numerosRequest.primerNumero!,
          this.numerosRequest.segundoNumero!
        )
        .subscribe((suma) => {
          this.suma = suma;
          this.isLoading = false;
        });
    }
  }
}
