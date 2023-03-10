import { LightningElement } from 'lwc';

export default class Lear9conditional extends LightningElement {

    areDetailsVisible = false;
    handleChange(event){
        this.areDetailsVisible = event.target.checked;
    }
}