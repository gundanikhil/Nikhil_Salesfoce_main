import { LightningElement, track } from 'lwc';
export default class CalculatorInLwc extends LightningElement {
    @track firstNumber;
    @track secondNumber;
    resultValue;
    greeting = 'Nikhil';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
    handleNumberOneChange(event) {
        this.firstNumber = parseInt(event.target.value);
    }
    handleNumberTwoChange(event) {
        this.secondNumber = parseInt(event.target.value);
    }
    addition() {
        this.resultValue = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }
    multification() {
        this.resultValue = this.firstNumber * this.secondNumber;
    }
    subtraction() {
        this.resultValue = this.firstNumber - this.secondNumber;
    }
    division() {
        this.resultValue = this.firstNumber / this.secondNumber;
    }
}