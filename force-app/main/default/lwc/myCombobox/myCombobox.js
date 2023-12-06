import { LightningElement } from 'lwc';

export default class MyCombobox extends LightningElement {

    options;
    value;

    connectedCallback() {
        this.options = [];
        let obj1 = { label: 1, value: 'i' };
        let obj2 = { label: 2, value: 'ii' };
        let obj3 = { label: 3, value: 'iii' };
        let obj4 = { label: 4, value: 'iv' };
        let obj5 = { label: 5, value: 'v' };
        let obj6 = { label: 6, value: 'vi' };
        this.options.push(obj1);
        this.options.push(obj2);
        this.options.push(obj3);
        this.options.push(obj4);
        this.options.push(obj5);
        this.options.push(obj6);
        this.value = 'vi';
    }

    handleValueChange(event) {
        this.value = event.detail.value;
    }
}