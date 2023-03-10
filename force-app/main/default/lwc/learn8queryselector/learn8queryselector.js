import { LightningElement } from 'lwc';

export default class Learn8queryselector extends LightningElement {

    greeting='Gokul';
    handleClick(event){
        this.greeting = this.template.querySelector("lightning-input").value;
    }
}
// datatable
// parent to ChannelSplitterNode
// test MessageChannel