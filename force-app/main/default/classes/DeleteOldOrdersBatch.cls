public class DeleteOldOrdersBatch implements Database.Batchable<sObject> {
    
    // Método start para coletar os registros que serão processados
    public Database.QueryLocator start(Database.BatchableContext context) {
        Date threeMonthsAgo = Date.today().addMonths(-3);
        return Database.getQueryLocator([SELECT Id FROM Order__c WHERE LastModifiedDate < :threeMonthsAgo]);
    }

    // Método execute para processar cada lote de registros
    public void execute(Database.BatchableContext context, List<sObject> scope) {
        delete scope;
    }

    // Método finish para executar operações de pós-processamento opcional 
    public void finish(Database.BatchableContext context) {
        // Não há operações de pós-processamento necessárias neste momento.
    }
}
