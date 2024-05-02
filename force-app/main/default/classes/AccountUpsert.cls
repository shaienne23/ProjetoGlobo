@RestResource(urlMapping='/upsertAccount/*')
global with sharing class AccountUpsert {

    @HttpPost
    global static String upsertAccount(String accountId, String accountName) {
        try {
            // Verifica se o usuário tem permissão de criar ou atualizar contas
            if (!Schema.sObjectType.Account.isCreateable() || !Schema.sObjectType.Account.isUpdateable()) {
                return 'Usuário não tem permissão para criar ou atualizar contas.';
            }
            
            Account acc;
            if (accountId != null && accountId != '') {
                // Verifica se o usuário tem permissão para acessar a conta
                if (!Schema.sObjectType.Account.isAccessible()) {
                    return 'Usuário não tem permissão para acessar a conta.';
                }
                
                acc = [SELECT Id, Name FROM Account WHERE Id = :accountId];
                acc.Name = accountName;
                update acc;
            } else {
                // Verifica se o usuário tem permissão para criar contas
                if (!Schema.sObjectType.Account.isCreateable()) {
                    return 'Usuário não tem permissão para criar contas.';
                }
                
                acc = new Account(Name = accountName);
                insert acc;
            }
            return 'Conta ' + acc.Id + ' upserted com sucesso.';
        } catch (Exception e) {
            return 'Erro ao upsertar conta: ' + e.getMessage();
        }
    }
}