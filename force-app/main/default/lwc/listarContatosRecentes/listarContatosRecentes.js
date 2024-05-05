import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactsController.getContacts';

export default class listarContatos extends LightningElement {
    @wire(getContacts)
    wiredContact;
}