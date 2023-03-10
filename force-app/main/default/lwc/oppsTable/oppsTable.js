import { LightningElement, track, wire } from 'lwc';
import getOpenOpps from '@salesforce/apex/OppsController.getOpenOpps';
 
const oppColumns = [
    { label: 'Opp Name', fieldName: 'Name' },
    { label: 'Account ID', fieldName: 'AccountId' },
    { label: 'Close Date', fieldName: 'CloseDate' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Stage', fieldName: 'StageName' },
    { label: 'Owner ID', fieldName: 'OwnerId' },
];
 
export default class OppsTable extends LightningElement {
    @track tableData = [];
    @track tableColumns = oppColumns;
 
    @wire(getOpenOpps)
    wiredOpps(result){
        if (result.data) {
            this.tableData = result.data;
        } else if (result.error) {
            this.tableData = undefined;
            console.log(result.error);
        }
    }
}