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

  
      // Chamar o método Apex para enviar email
      sendEmailNotification({ accList: [{Id: accountId}], additionalContent: '' })
          .then(result => {
            const successMessage = `Cadastro realizado com sucesso.`;
              this.showToast('Sucesso', successMessage, 'success');
  
              // Resetar os campos de entrada após o sucesso
              const inputFields = this.template.querySelectorAll('lightning-input-field');
              if (inputFields) {
                  inputFields.forEach((field) => field.reset());
              }
          })
          .catch(error => {
            this.showToast('Erro', 'Ocorreu um erro ao inserir o cadastro.', 'error');
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
