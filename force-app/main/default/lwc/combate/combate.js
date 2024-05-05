import { LightningElement } from 'lwc';
import COMBATE1 from '@salesforce/resourceUrl/COMBATE1';
import COMBATE2 from '@salesforce/resourceUrl/COMBATE2';
import COMBATE3 from '@salesforce/resourceUrl/COMBATE3';

export default class Carrossel extends LightningElement {
    valor1 = COMBATE1;
    valor2 = COMBATE2;
    valor3 = COMBATE3;
}