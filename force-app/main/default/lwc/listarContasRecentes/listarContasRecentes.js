import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class listarContas extends LightningElement {
    @wire(getAccounts)
    wiredAccount;
}