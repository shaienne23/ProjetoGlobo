import { LightningElement } from 'lwc';
import GLOBOPLAY1 from '@salesforce/resourceUrl/GLOBOPLAY1';
import GLOBOPLAY2 from '@salesforce/resourceUrl/GLOBOPLAY2';
import GLOBOPLAY3 from '@salesforce/resourceUrl/GLOBOPLAY3';

export default class Carrossel extends LightningElement {
    valor1 = GLOBOPLAY1;
    valor2 = GLOBOPLAY2;
    valor3 = GLOBOPLAY3;
}