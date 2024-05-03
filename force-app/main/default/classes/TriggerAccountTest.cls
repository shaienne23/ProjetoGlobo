@isTest
private class TriggerAccountTest {

    @isTest
    static void testTriggerLogic() {
        // Criar uma conta de teste
        Account testAccount = new Account(
            Name = 'Test Account',
            Email__c = 'test@example.com'
        );

        // Inserir a conta
        Test.startTest();
        insert testAccount;
        Test.stopTest();

        // Verificar se o e-mail de inserção foi enviado
        System.assertEquals(1, Limits.getEmailInvocations(), 'Deveria ter enviado um e-mail após a inserção da conta.');

        // Atualizar a conta
        testAccount.Name = 'Updated Test Account';

        // Atualizar a conta
        Test.startTest();
        update testAccount;
        Test.stopTest();

        // Verificar se o e-mail de atualização foi enviado
        System.assertEquals(2, Limits.getEmailInvocations(), 'Deveria ter enviado um e-mail após a atualização da conta.');
    }
}
