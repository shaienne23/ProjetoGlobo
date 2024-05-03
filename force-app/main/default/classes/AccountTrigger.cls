public with sharing class AccountTrigger {
  @AuraEnabled
  public static void sendEmailOnInsert(List<Account> accList){
      sendEmailNotification(accList, 'Obrigado por se cadastrar!<br/><br/>'+
      'Globo.com<br/><br/>');
  }

  @AuraEnabled
  public static void sendEmailOnUpdate(List<Account> accList){
      sendEmailNotification(accList, 'Seu perfil foi atualizado!<br/><br/>'+
      'Globo.com<br/><br/>');
  }

  @AuraEnabled
  public static void sendEmailNotification(List<Account> accList, String additionalContent){
      List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

      for(Account acc : accList){
          if(acc.Email__c != null){
              Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
              String[] toAddresses = new String[] {acc.Email__c};
              emailMsg.setToAddresses(toAddresses);
              String emailSub = 'Olá ' + acc.Name;
              emailMsg.setSubject(emailSub);
              String disName = 'Notificação - Globo.com';
              emailMsg.setSenderDisplayName(disName);

              String content = 'Olá ' + acc.Name + ', <br/><br/>'+
                  'A equipe Globo, fica feliz em te-lo conosco!<br/><br/>' + 
                  additionalContent;

              emailMsg.setHtmlBody(content);
              emailList.add(emailMsg);
          }
      }
      Messaging.sendEmail(emailList);
  }
}
