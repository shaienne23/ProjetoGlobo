import { LightningElement, track, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import sendEmailNotification from '@salesforce/apex/AccountTrigger.sendEmailNotification';


export default class AccountEmailConfig extends LightningElement {
    @track emailAddress = '';
    @track sendEmail = true;
    @track message = '';
    areSendEmail = false;

    handleEmailChange(event) {
        this.emailAddress = event.target.value;
    }

    handleSuccess(event) {
        const accountId = event.detail.id;
        const action = this.sendEmail ? 'ativar' : 'desativar';
        this.message = `Enviando email após ${action} a atualização da conta...`;

        // Chamar o método Apex para enviar email
        sendEmailNotification({accountId: accountId})
            .then(result => {
                const successMessage = `O estado de envio de e-mail foi ${action} com sucesso.`;
                this.showToast('Sucesso', successMessage, 'success');
            })
            .catch(error => {
                this.showToast('Erro', 'Ocorreu um erro ao enviar o e-mail.', 'error');
            });
    }

    handleChange(event) {
        this.areSendEmail = event.target.checked;
    }

    handleSendEmailChange(event) {
        this.sendEmail = event.target.checked;
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}
