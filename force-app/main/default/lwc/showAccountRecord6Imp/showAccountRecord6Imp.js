import { LightningElement, track } from 'lwc';
import getAccountDetails from '@salesforce/apex/RecordFetcherController.getAccountDetails';

export default class ShowAccountRecord6Imp extends LightningElement {
    type;
    @track accountRecords;

    handleTypeChange(event) {
        this.type = event.detail.value;
    }

    handleClick() {
        getAccountDetails({ accType: this.type })
            .then((data) => {
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
            })
            .catch((error) => {
                console.log(error);
            });
    }
}