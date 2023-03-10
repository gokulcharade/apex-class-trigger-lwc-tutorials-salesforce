import { LightningElement,api } from 'lwc';

export default class Learn51 extends LightningElement {
    message = 'public property';
    @api recordId;
}