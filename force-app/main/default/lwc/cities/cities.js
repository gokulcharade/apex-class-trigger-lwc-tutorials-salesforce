import { LightningElement, track, api } from 'lwc'; //importing lwc ad track
import {NavigationMixin} from 'lightning/navigation'
import cities from  '@salesforce/apex/fetchCities.cityList'; //importing apex class

export default class Cities extends NavigationMixin(LightningElement) { //cities class is extending the elemenet for interaction of lwc

    @track data = [];

    connectedCallback(){ //connectedCallback() method of this class will be executed when there is a response from the server.
        cities()
        .then(response => {
            this.data = response;
        })
        .catch(error => {
            console.log(error);
        })
    }

    handleClick(event){
        const recordId = event.target.value;
        console.log(recordId);

        // this[NavigationMixin.Navigate]({
        //     type:'standard__webPage',
        //     attributes: {
        //         // name: 'city_Detail__c',
        //         url: 'www.google.com'

        //     }
        //     // .then(generatedUrl => {
        //     //     window.open(generatedUrl);
        //     // })
        // })

    }
}