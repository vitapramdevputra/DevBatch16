import { LightningElement } from 'lwc';

export default class ParentLwcEvent extends LightningElement {
    count = 0;
    name;
    handleChildButtonClick(event) {
        this.count++;

    }
    handleHelloClick(event) {
        this.name = event.detail.name + ' -- ' + event.detail.age + '-- ' + event.detail.hobby;

    }
}