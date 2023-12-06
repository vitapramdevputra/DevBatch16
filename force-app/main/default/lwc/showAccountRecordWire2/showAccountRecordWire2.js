import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, track, wire } from 'lwc';

import ACC_ID from '@salesforce/schema/Account.Id';
import ACC_NAME from '@salesforce/schema/Account.Name';
import ACC_NUMBER from '@salesforce/schema/Account.AccountNumber';
import ACC_WEBSITE from '@salesforce/schema/Account.Website';
import ACC_ANNUALREVENUE from '@salesforce/schema/Account.AnnualRevenue';




export default class ShowAccountRecordWire2 extends LightningElement {
    recId = '001Dp0000045jfKIAQ'
    @track accountRecord;

    @wire(getRecord, { recordId: '$recId', fields: [ACC_ID, ACC_NAME, ACC_NUMBER, ACC_WEBSITE, ACC_ANNUALREVENUE] })
    getAccountRecord({ error, data }) {
        if (data) {
            this.accountRecord = {
                Id: data.fields.Id.value,
                Name: data.fields.Name.value,
                Website: data.fields.Website.value,
                AccountNumber: data.fields.AccountNumber.value,
                AnnualRevenue: data.fields.AnnualRevenue.value
            }
            console.log('Data', data);
        } else if (error) {
            console.error('Error:', error);
        }
    }
}