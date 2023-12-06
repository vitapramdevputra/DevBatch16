import { LightningElement } from 'lwc';

export default class AdvanceLwcCalculator extends LightningElement {

    firstNum;
    secondNum;

    result;

    handleFirstNumberChange(event) {
        this.firstNum = parseInt(event.detail.value);
    }

    handleSecondNumberChange(event) {
        this.secondNum = parseInt(event.detail.value);
    }
    handleAdd() {

        let res = this.firstNum + this.secondNum;
        this.result = `total sum is 🥁 🥁 ${res}`;
    }
}