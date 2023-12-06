import { LightningElement } from 'lwc';

export default class PuzzleLwc extends LightningElement {

    randomNumbers = [];
    alreadyRendered = false;

    connectedCallback() {
        let i = 1;
        while (i < 9) {
            let num = parseInt(Math.random() * 10);
            if (num != 0 && num != 9 && (!this.randomNumbers.includes(num))) {
                this.randomNumbers.push(num);
                i++;
            }
            console.log('connected callback, random numbers: ' + this.randomNumbers);

        }

    }
    renderedCallback() {
        if (!this.alreadyRendered) {
            this.alreadyRendered = true;
            let allButtons = this.template.querySelectorAll('lightning-button');
            console.log('all buttons: ' + allButtons);
            for (let index = 0; index < this.randomNumbers.length; index++) {
                const element = this.randomNumbers[index];
                debugger;
                allButtons[index].label = element;
            }
        }
    }


    handleNumberClick(event) {
        debugger;
        let targetId = event.target.dataset.id;
        console.log(targetId);
        if (targetId == '1') {
            let button2 = this.template.querySelector('[data-id="2"]');
            let button4 = this.template.querySelector('[data-id="4"]');
            this.swapNumber(event, [button2, button4]);

        }
        if (targetId == '2') {
            let button1 = this.template.querySelector('[data-id="1"]');
            let button3 = this.template.querySelector('[data-id="3"]');
            let button5 = this.template.querySelector('[data-id="5"]');
            this.swapNumber(event, [button1, button3, button5]);
        }
        if (targetId == '3') {
            let button2 = this.template.querySelector('[data-id="2"]');
            let button6 = this.template.querySelector('[data-id="6"]');
            this.swapNumber(event, [button2, button6]);

        }
        if (targetId == '4') {
            let button1 = this.template.querySelector('[data-id="1"]');
            let button5 = this.template.querySelector('[data-id="5"]');
            let button7 = this.template.querySelector('[data-id="7"]');
            this.swapNumber(event, [button1, button5, button7]);

        }
        if (targetId == '5') {
            let button2 = this.template.querySelector('[data-id="2"]');
            let button4 = this.template.querySelector('[data-id="4"]');
            let button6 = this.template.querySelector('[data-id="6"]');
            let button8 = this.template.querySelector('[data-id="8"]');
            this.swapNumber(event, [button2, button4, button6, button8]);

        }
        if (targetId == '6') {
            let button3 = this.template.querySelector('[data-id="3"]');
            let button5 = this.template.querySelector('[data-id="5"]');
            let button9 = this.template.querySelector('[data-id="9"]');
            this.swapNumber(event, [button3, button5, button9]);

        }
        if (targetId == '7') {
            let button4 = this.template.querySelector('[data-id="4"]');
            let button8 = this.template.querySelector('[data-id="8"]');
            this.swapNumber(event, [button4, button8]);

        }
        if (targetId == '8') {
            let button7 = this.template.querySelector('[data-id="7"]');
            let button5 = this.template.querySelector('[data-id="5"]');
            let button9 = this.template.querySelector('[data-id="9"]');
            this.swapNumber(event, [button7, button5, button9]);

        }
        if (targetId == '9') {
            let button6 = this.template.querySelector('[data-id="6"]');
            let button8 = this.template.querySelector('[data-id="8"]');
            this.swapNumber(event, [button6, button8]);

        }

    }
    swapNumber(clickedEvent, buttonArray) {
        for (const btn of buttonArray) {
            if (btn.label == '-') {
                btn.label = clickedEvent.target.label;
                clickedEvent.target.label = '-';
                break;
            }
        }

        this.checkWin();


    }
    checkWin() {
        let myWinArray = ['1', '2', '3', '4', '5', '6', '7', '8', '-',]
        let allButtons = this.template.querySelectorAll('lightning-button');
        console.log('all buttons: ' + allButtons);
        let won = true;
        for (let index = 0; index < allButtons.length; index++) {
            if (allButtons[index].label != myWinArray[index]) {
                won = false;
                break;
            }

        }


        if (won === true) {
            alert('YOU WON. Celebrate.');
        }
    }

}