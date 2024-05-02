@isTest
private class AccountUpsertTest {

    @isTest
    static void testUpsertAccount() {
        // Crie uma conta de teste
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // Chame o método upsertAccount com o ID da conta criada e um novo nome
        String result = AccountUpsert.upsertAccount(acc.Id, 'New Account Name');
        
        // Verifique se a conta foi atualizada com sucesso
        System.assertEquals('Conta ' + acc.Id + ' upserted com sucesso.', result);
        
        // Verifique se a conta foi atualizada corretamente no banco de dados
        Account updatedAcc = [SELECT Id, Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('New Account Name', updatedAcc.Name);
    }
    
    @isTest
    static void testCreateAccount() {
        // Chame o método upsertAccount sem fornecer um ID de conta para criar uma nova conta
        String result = AccountUpsert.upsertAccount(null, 'New Account');
        
        // Verifique se a nova conta foi criada com sucesso
        System.assert(result.contains('upserted com sucesso.'));
        
        // Verifique se a nova conta foi criada corretamente no banco de dados
        Account newAcc = [SELECT Id, Name FROM Account WHERE Name = 'New Account'];
        System.assertNotEquals(null, newAcc);
    }
    
    
    @isTest
    static void testErrorHandling() {
        // Testar tratamento de exceção
        String result = AccountUpsert.upsertAccount('invalidId', 'New Account Name');
        //Verificar mensagem de erro
        System.assert(result.contains('Erro ao upsertar conta:'));
    }
}