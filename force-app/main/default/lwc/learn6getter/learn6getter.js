  import { LightningElement } from 'lwc';

export default class Learn6getter extends LightningElement {

  firstName="";
  lastName="";

  handleChange(event){
    const field =event.target.name;
    if(field === "fname"){
        this.firstName = event.target.value;
    }else if(field === "lname"){
      this.lastName = event.target.value;
    }
  }

  //getter
  get uppercasedFullName(){
    return `${this.firstName} ${this.lastName}`.toUpperCase();
  }

}