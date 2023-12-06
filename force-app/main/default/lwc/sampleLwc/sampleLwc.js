import { LightningElement, track } from 'lwc';

export default class SampleLwc extends LightningElement {
    name = 'John John'
    @track allNames = []

    handleOnChange(event) {
        console.log('here here');
        console.log(event.detail.value);
        this.name = event.detail.value;
    }

    handleClick() {
        this.allNames.push(this.name);
    }

    renderedCallback() {
        console.log('--');
        console.log('rendered callback is called.' + this.name);;

        console.log('---');

    }
}