import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';


import ACC_ID from '@salesforce/schema/Account.Id'
import ACC_NAME from '@salesforce/schema/Account.Name'
import ACC_NUMBER from '@salesforce/schema/Account.AccountNumber'
import ACC_WEBSITE from '@salesforce/schema/Account.Website'
import ACC_REVENUE from '@salesforce/schema/Account.AnnualRevenue'



export default class ShowAccountRecordWire extends LightningElement {

    recordId = '001Dp0000045jfKIAQ';

    @wire(getRecord, { recordId: '$recordId', fields: [ACC_ID, ACC_NAME, ACC_NUMBER, ACC_WEBSITE, ACC_REVENUE] })
    accountRecord;

}