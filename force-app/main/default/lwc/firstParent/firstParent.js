import { LightningElement } from 'lwc';

export default class FirstParent extends LightningElement {

    //first
    constructor() {
        super();
        console.log('* Parent constructor from parent called.');
        const para = this.template.querySelector("p"); //CANNOT Access ANY element from html. 
        //call api
        console.log('* Parent Constructor parent component p: ' + para);
    }
    //second
    connectedCallback() {
        console.log('* Parent Connected callback of parent. respect.');
        const para = this.template.querySelector("p");
        console.log('* Parent Connected callback parent component p: ' + para);

    }
    // render() {
    //     console.log('render: from parent.');
    // }

    renderedCallback() {
        console.log('* Parent renderedCallback callback of parent. respect.');
        const para = this.template.querySelector("p");
        console.log('* Parent renderedCallback callback parent component p: ' + para);
    }
    disconnectedCallback() {
        console.log('disconnected. aaa..aaaa...aaa');
    }
    handleRemove(event) {
        console.log('removing....');
        const btn = event.target;
        btn.remove();
        const chld = this.template.querySelector('c-first-child');
        chld.remove();
        //this.template.removeChild(btn);
    }
}