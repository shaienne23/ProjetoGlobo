@isTest
private class AccountTriggerTest {

    @isTest
    static void testSendEmailOnInsert() {
        // Criar uma conta de teste
        Account testAccount = new Account(
            Name = 'Test Account',
            Email__c = 'test@example.com'
        );
        insert testAccount;

        // Chamar o método de inserção de e-mail
        Test.startTest();
        AccountTrigger.sendEmailOnInsert(new List<Account>{testAccount});
        Test.stopTest();

        // Verificar se o e-mail foi enviado
        System.assertEquals(1, Limits.getEmailInvocations(), 'Deveria ter enviado um e-mail após a inserção da conta.');
    }

    @isTest
    static void testSendEmailOnUpdate() {
        // Criar uma conta de teste
        Account testAccount = new Account(
            Name = 'Test Account',
            Email__c = 'test@example.com'
        );
        insert testAccount;

        // Atualizar a conta de teste
        testAccount.Name = 'Updated Test Account';
        update testAccount;

        // Chamar o método de atualização de e-mail
        Test.startTest();
        AccountTrigger.sendEmailOnUpdate(new List<Account>{testAccount});
        Test.stopTest();

        // Verificar se o e-mail foi enviado
        System.assertEquals(1, Limits.getEmailInvocations(), 'Deveria ter enviado um e-mail após a atualização da conta.');
    }
}