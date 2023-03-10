import { LightningElement, track, api } from 'lwc';
import createPersonAccount from '@salesforce/apex/CreatePersonAccountController.createPersonAccount';

export default class CreatePersonAccount extends LightningElement {
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    handlePhoneChange(event) {
        this.phone = event.target.value;
    }

    createAccount() {
        createPersonAccount({ firstName: this.firstName, lastName: this.lastName, email: this.email, phone: this.phone })
            
            .then(accountId => {
                console.log('Created account with Id: ' + accountId);
                // Do something with the account Id, such as navigate to the account record page
            })
            .catch(error => {
                console.error(error);
                // Handle the error appropriately
            });
    }
}