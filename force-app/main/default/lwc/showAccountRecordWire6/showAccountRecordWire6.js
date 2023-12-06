import { LightningElement, track } from 'lwc';
import getAccountTypePicklistValue from '@salesforce/apex/RecordFetcherController.getAccountTypePicklistValue';
import getAccountDetails from '@salesforce/apex/RecordFetcherController.getAccountDetails';

export default class ShowAccountRecordWire6 extends LightningElement {
    @track accTypeOptions;
    @track selectedAccType
    type;
    @track accountRecords;

    connectedCallback() {
        getAccountTypePicklistValue()
            .then((data) => {
                this.accTypeOptions = [];
                for (const temp of data) {
                    this.accTypeOptions.push({ label: temp, value: temp });
                }
                this.selectedAccType = data[0];
            })
            .catch((error) => {
                console.log(error);
            })
    }
    handleTypeChange(event) {
        this.type = event.detail.value;
    }
    handleClick() {
        getAccountDetails({ accType: this.type })
            .then((data) => {
                this.accountRecords = [];
                for (const rec of data) {
                    let temp = {
                        Id: rec.Id,
                        Name: rec.Name,
                        AccountNumber: rec.AccountNumber,
                        Phone: rec.Phone,
                        AnnualRevenue: rec.AnnualRevenue,
                        Type: rec.Type,
                        link: "/lightning/r/Account" + rec.Id + "/view"
                    };
                    this.accountRecords.push(temp);
                }
            }).catch((error) => {
                console.log(error);
            })
    }
}