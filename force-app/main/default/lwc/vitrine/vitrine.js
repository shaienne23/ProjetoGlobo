import { LightningElement } from 'lwc';
import Cartola from '@salesforce/resourceUrl/Cartola';
import Combate from '@salesforce/resourceUrl/Combate';

export default class Evento extends LightningElement {
    mostrarEvento1 = true;
    mostrarEvento2 = false;

    evento1 = Cartola;
    evento2 = Combate;

    ocultarImagem() {
        this.mostrarEvento1 = !this.mostrarEvento1;
        this.mostrarEvento2 = !this.mostrarEvento2;
    }
}