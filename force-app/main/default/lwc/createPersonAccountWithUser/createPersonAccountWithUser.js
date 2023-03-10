import { LightningElement, track } from 'lwc';
import createPersonAccountWithUser from '@salesforce/apex/CreatePersonAccountWithUserController.createPersonAccountWithUser';

export default class CreatePersonAccountWithUser extends LightningElement {
    @track firstName;
    @track lastName;
    @track email;

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
    }

    createPersonAccountWithUser() {

        createPersonAccountWithUser({ 
            firstName: this.firstName, 
            lastName: this.lastName, 
            email: this.email, 
        })
        .then(() => {
            // Show success message
            const successEvent = new ShowToastEvent({
                title: 'Success',
                message: 'Person Account with User created successfully',
                variant: 'success'
            });
            this.dispatchEvent(successEvent);
            
            // Reset input fields
            this.firstName = '';
            this.lastName = '';
            this.email = '';
        })
        .catch((error) => {
            // Show error message
            const errorEvent = new ShowToastEvent({
                title: 'Error',
                message: error.body.message,
                variant: 'error'
            });
            this.dispatchEvent(errorEvent);
        });
    }
}
