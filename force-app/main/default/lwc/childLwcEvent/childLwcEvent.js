import { LightningElement } from 'lwc';

export default class ChildLwcEvent extends LightningElement {
    count = 0;
    name;

    handleNameChange(event) {
        this.name = event.detail.value;
    }
    handleClick() {
        // const ce = new CustomEvent('childbuttonclick');
        // this.dispatchEvent(ce);

        this.dispatchEvent(new CustomEvent("childbuttonclick"));
        this.dispatchEvent(new CustomEvent("hellohello", {
            detail: {
                name: this.name,
                age: 1,
                hobby: 'photo'
            }
        }));
    }
}