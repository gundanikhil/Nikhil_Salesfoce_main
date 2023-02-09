import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'Nikhil';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}