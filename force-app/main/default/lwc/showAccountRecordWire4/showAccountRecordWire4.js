import { LightningElement, wire, track } from 'lwc';
import getAccountDetail from '@salesforce/apex/RecordFetcherController.getAccountDetail'

export default class ShowAccountRecordWire4 extends LightningElement {
    accId;
    accountId;
    @track accountRecord;


    handleIdChange(event) {
        this.accId = event.detail.value;
    }
    handleClick() {
        this.accountId = this.accId;
    }

    @wire(getAccountDetail, { accId: '$accountId' })
    accountDetail({ error, data }) {
        if (data) {
            console.log('Data', data);
            this.accountRecord = data;
        } else if (error) {
            console.error('Error:', error);
        }
    }


}

