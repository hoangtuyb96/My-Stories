import { Component, OnInit } from '@angular/core';
import { InfoUserComponent } from '../../info-user/info-user.component'

@Component({
  selector: 'app-update-user-name',
  templateUrl: './update-user-name.component.html',
  styles: [
    `
      .form {
        width: 500px;
      }
      
      .full-width {
        width: 100%;
      }
    `
  ],
  providers: [ InfoUserComponent ]
})
export class UpdateUserNameComponent implements OnInit {

  constructor() {
  }

  ngOnInit() {
  }

  onSubmit(value: any) {
    console.log(value)
  }
}
