public with sharing class AccountTrigger {
  @AuraEnabled
  public static void sendEmailNotification(List<Account> AccList){
    List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

    for(Account acc : AccList){
        if(acc.Email__c != null){
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {acc.Email__c};
            emailMsg.setToAddresses(toAddresses);
            String emailSub = 'Bem-vindo ' + acc.Name;
            emailMsg.setSubject(emailSub);
            String disName = 'Bem-vindo Notificação - Shai';
            emailMsg.setSenderDisplayName(disName);

            String content = 'Olá ' + acc.Name + ', <br/><br/>'+
                'Bem-vindo à Globo!<br/><br/>';
                

                if(isInsert){
                  content += '<br/><br/> Obrigado por se cadastrar!';
              }
                if(isUpdate){
                  content += '<br/><br/> Seu perfil foi atualizado!';
              }

            emailMsg.setHtmlBody(content);
            emailList.add(emailMsg);
        }
    }
    Messaging.sendEmail(emailList);
}
}