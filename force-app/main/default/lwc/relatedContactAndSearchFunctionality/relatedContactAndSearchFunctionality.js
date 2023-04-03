import { LightningElement, track, api } from "lwc";
import getContactList from "@salesforce/apex/Controller_getContactListOfAcc.getContactList";

let columns = [
  { label: "Name", fieldName: "Name" },
  { label: "Phone", fieldName: "Phone" }
];

export default class RelatedContactAndSearchFunctionality extends LightningElement {
  @track buttonLabel = "Show related Contacts";
  @track showContacts = false;
  columns = columns;
  @api searchKey = "";
  @api recordId;
  @track data = [];
  connectedCallback() {
    getContactList({ recorId: this.recordId, searchQuery: " " }) //queries the controller that returns all the related contacts
      .then((response) => {
        this.data = response;
        // console.log(this.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }

  searchedContacts(event) {
    //executes everytime there is a change in the search input key
    this.searchKey = event.target.value;
    // console.log(this.searchKey);
    getContactList({ recorId: this.recordId, searchQuery: this.searchKey })
      .then((response) => {
        this.data = response;
      })
      .catch((err) => {
        console.log(err);
      });
  }

  handleClick(event) {
    //show / hide button's eventlistener ---> show the related contacts to the account and hides it onclick
    if (event.target.label === "Show related Contacts") {
      this.buttonLabel = "Hide related Contacts";
      this.showContacts = true;
    } else if (event.target.label === "Hide related Contacts") {
      this.buttonLabel = "Show related Contacts";
      this.showContacts = false;
    }
  }
}
