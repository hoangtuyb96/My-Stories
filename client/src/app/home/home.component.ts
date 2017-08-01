import { Component, OnInit } from '@angular/core';
import { MdToolbarModule } from '@angular/material';
import { MdChipsModule } from '@angular/material';
import * as $ from 'jquery';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  providers: [MdToolbarModule, MdChipsModule]
})
export class HomeComponent implements OnInit {

  constructor() { }

  color: string;

  availableColors = [
    { name: 'Học hỏi', color: '' },
    { name: 'Chia sẻ', color: 'primary' },
    { name: 'Giao lưu', color: 'accent' }
  ];

  ngOnInit() {
  }

}
