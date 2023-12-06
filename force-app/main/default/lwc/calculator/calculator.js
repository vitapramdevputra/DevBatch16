import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {

    prevNumber;
    currentNumber;
    selectedOperator;
    alreadyClicked = false;
    alreadyClickedForNumber = false;

    handleNumberClick(event) {
        let enteredValue = event.target.label;
        const textField = this.template.querySelector("lightning-input");
        if (this.alreadyClickedForNumber === true) {
            textField.value = enteredValue;
            this.alreadyClickedForNumber = false;
        }
        else {
            textField.value = textField.value + enteredValue;
        }
        this.currentNumber = parseFloat(textField.value);
        this.numberClicked = true;
    }

    handleTextChange(event) {
        this.currentNumber = parseFloat(event.detail.value);
    }

    handleOperationClick(event) {
        let operator = event.target.label;
        if (this.alreadyClicked === true) {
            let res = 0;
            if (this.selectedOperator === "/") {
                res = this.prevNumber / this.currentNumber;
            }
            else if (this.selectedOperator === 'x') {
                res = this.prevNumber * this.currentNumber;
            }
            else if (this.selectedOperator === '-') {
                res = this.prevNumber - this.currentNumber;
            }
            else {
                res = this.prevNumber + this.currentNumber;
            }
            const textField = this.template.querySelector("lightning-input");
            textField.value = res;
            this.prevNumber = res;
        }
        else {
            this.prevNumber = this.currentNumber;
            this.currentNumber = undefined;
            const textField = this.template.querySelector("lightning-input");
            textField.value = "";
        }
        this.alreadyClicked = true;
        this.selectedOperator = operator;
        this.alreadyClickedForNumber = true;
    }

    handleEqualClick() {
        let res = 0;
        if (this.selectedOperator === "/") {
            res = this.prevNumber / this.currentNumber;
        }
        else if (this.selectedOperator === 'x') {
            res = this.prevNumber * this.currentNumber;
        }
        else if (this.selectedOperator === '-') {
            res = this.prevNumber - this.currentNumber;
        }
        else {
            res = this.prevNumber + this.currentNumber;
        }
        const textField = this.template.querySelector("lightning-input");
        textField.value = res;
        this.currentNumber = res;
        this.prevNumber = undefined;
        this.alreadyClicked = false;
    }

    handleClearClick() {
        this.currentNumber = undefined;
        this.prevNumber = undefined;
        this.selectedOperator = undefined;
        this.alreadyClicked = false;
        const textField = this.template.querySelector("lightning-input");
        textField.value = "";
        this.alreadyClickedForNumber = false;
    }
}