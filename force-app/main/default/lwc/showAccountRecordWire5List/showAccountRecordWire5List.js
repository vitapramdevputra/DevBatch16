import { LightningElement, track, wire } from 'lwc';
import getAccountDetails from '@salesforce/apex/RecordFetcherController.getAccountDetails';

export default class ShowAccountRecordWire5List extends LightningElement {
    type;
    accountType;
    @track accountRecords;

    @wire(getAccountDetails, { accType: '$accountType' })
    accountDetails({ data, error }) {
        if (data) {
            this.accountRecords = [];
            for (let rec of data) {
                let temp = {
                    Id: rec.Id,
                    Name: rec.Name,
                    AccountNumber: rec.AccountNumber,
                    Phone: rec.Phone,
                    AnnualRevenue: rec.AnnualRevenue,
                    Type: rec.Type,
                    Link: "/lightning/r/Account/" + rec.Id + "/view"
                };
                this.accountRecords.push(temp);
            }
        }
        if (error) {
            console.log(error);
        }
    }
    handleTypeChange(event) {
        this.type = event.detail.value;
    }

    handleClick() {
        this.accountType = this.type;
    }
}