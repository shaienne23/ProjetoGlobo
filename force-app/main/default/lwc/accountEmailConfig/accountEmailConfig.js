import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import sendEmailNotification from '@salesforce/apex/AccountTrigger.sendEmailNotification';

export default class AccountEmailConfig extends LightningElement {
    @track emailAddress = '';
    @track message = '';
    areSendEmail = false;

    handleEmailChange(event) {
        this.emailAddress = event.target.value;
    }

    handleSuccess(event) {
        const accountId = event.detail.id;
        const action = this.areSendEmail ? 'ativar' : 'desativar';
    
        // Chamar o método Apex para enviar email
        sendEmailNotification({ accList: [{Id: accountId}], additionalContent: '' })
            .then(result => {
                const successMessage = 'Registro criado com sucesso!'; 
                const event = new ShowToastEvent({
                    title: 'Sucesso',
                    message: successMessage,
                    variant: 'success'
                });
                this.dispatchEvent(event);
                this.clearFields();
            })
            .catch(error => {
                this.showToast('Erro', 'Ocorreu um erro ao inserir o cadastro.', 'error');
            });
    }
    
    
    // booleano checkbox aparece o Campo de entrada email - default false
    handleChange(event) {
        this.areSendEmail = event.target.checked;
    }
    clearFields() {
        this.emailAddress = ''; // Limpa o campo de email
         const inputFields = this.template.querySelectorAll('lightning-input-field');
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
    }}

}