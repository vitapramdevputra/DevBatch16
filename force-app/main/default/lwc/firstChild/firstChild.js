import { LightningElement } from 'lwc';

export default class FirstChild extends LightningElement {
    name = 'Study group';
    constructor() {
        super();
        console.log('CHILD Constructorrr.');
    }
    connectedCallback() {
        console.log('CHILD Connected callback of CHILD. love.');
        const para = this.template.querySelector("p");
        console.log('CHILD Connected callback CHILD component p: ' + para);

    }
    renderedCallback() {
        console.log('CHILD renderedCallback callback of  CHILD. love.');
        const para = this.template.querySelector("p");
        console.log('CHILD renderedCallback callback  CHILD.  component p: ' + para);
    }
    disconnectedCallback() {
        console.log('disconnected child. aaa..aaaa...aaa');
    }
    handleOnChange(event) {
        //console.log('CHILD here here');
        //console.log('CHILD' + event.detail.value);
        this.name = event.detail.value;
    }
}