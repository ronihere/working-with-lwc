import { LightningElement, wire } from "lwc";
import { reduceErrors } from "c/ldsUtils";
import getContacts from "@salesforce/apex/ContactController.getContacts";
import FNAME_FIELD from "@salesforce/schema/Contact.FirstName";
import LNAME_FIELD from "@salesforce/schema/Contact.LastName";
import EMAIL_FIELD from "@salesforce/schema/Contact.Email";
const dataTableColumns = [
  { label: "First Name", fieldName: FNAME_FIELD.fieldApiName, type: "text" },
  { label: "Last Name", fieldName: LNAME_FIELD.fieldApiName, type: "text" },
  { label: "Email", fieldName: EMAIL_FIELD.fieldApiName, type: "email" }
];
export default class ContactList extends LightningElement {
  columns = dataTableColumns;
  @wire(getContacts)
  contacts;
  get errors() {
    return this.contacts.error ? reduceErrors(this.contacts.error) : [];
  }
}
