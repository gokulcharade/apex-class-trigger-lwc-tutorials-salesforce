import { LightningElement,wire } from 'lwc';
import { getRecordIds } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class DisplayAllAccountRecordIds extends LightningElement {
    accountRecordIds;

    @wire(getRecordIds, { objectApiName: ACCOUNT_OBJECT })
    wiredAccountRecordIds({ data, error }) {
        if (data) {
            this.accountRecordIds = data;
        } else if (error) {
            console.error(error);
        }
    }
}