import { LightningElement } from 'lwc';
import create from '@salesforce/apex/CreateAccountsController.create';

export default class CreateAccount1 extends LightningElement {
    accountName;
    expiryDate;
    emp;
    annualRevenue;

    handleAccountNameChange(event) {
        this.accountName = event.detail.value;
    }

    handleExpirationDateChange(event) {
        this.expiryDate = event.detail.value;
    }

    handleNumberOfEmployeesChange(event) {
        this.emp = event.detail.value;
    }

    handleAnnualRevenueChange(event) {
        this.annualRevenue = event.detail.value;
    }

    handleCreate() {
        if (this.accountName == undefined) {
            alert("Account Name is required to create an Account!");
        }
        else {
            create({ name: this.accountName, expiry: this.expiryDate, employees: this.emp, revenue: this.annualRevenue })
                .then((data) => {
                    alert('SUCESS');
                    console.log(data);
                })
                .catch((error) => {
                    console.log(error);
                });
        }
    }
}