public with sharing class AgendamentoDeletarPedidos implements Schedulable {
    public void execute(SchedulableContext context) {
        // Instanciar e executar a classe de lote
        DeleteOldOrdersBatch batchJob = new DeleteOldOrdersBatch();
        Database.executeBatch(batchJob);
    }
}