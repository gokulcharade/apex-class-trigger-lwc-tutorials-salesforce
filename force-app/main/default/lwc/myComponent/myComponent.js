import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {
    get city(){ //defining a get accessor
        return this.city;
    }
}