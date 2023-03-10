import { LightningElement } from 'lwc';

export default class Map extends LightningElement {

    mapMarkers;
  zoomLevel;
  listView;
  connectedCallback() {
    this.mapMarkers = [
      {
        location: {
          City: "Ajmer",
          Country: "India",
          PostalCode: "305001",
          State: "RJ",
          Street: "Ajay Nagar"
        },
        title: "Salesforce Bolt",
        description: "I am here",
        icon: "standard:account"
      },
      {
        location: {
          City: "Ajmer",
          Country: "India",
          PostalCode: "305001",
          State: "RJ",
          Street: "Vaishali Nagar"
        },
        title: "Test Location",
        description: "Success !",
        icon: "standard:account"
      }
    ];
    //Google Maps API supports zoom levels from 1 to 22 in desktop browsers, and from 1 to 20 on mobile.
    this.zoomLevel = 10;
    this.listView = "visible";
  }
}