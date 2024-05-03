@isTest
private class DeleteOldOrdersBatchTest {
    @isTest
    static void testBatchExecution() {
        // Preparação
        List<Order__c> testOrders = new List<Order__c>();
        // Crie alguns registros de teste para orders com datas de modificação mais antigas que três meses
        for(Integer i = 0; i < 10; i++) {
            Order__c testOrder = new Order__c(
             
                Name = 'Pedido Teste ' + i,
                Conta__c = '001aj00000FXXEIAA5', // Substitua 'ID_da_Conta' pelo ID válido de uma conta existente
                Valor_Total_Pedido__c = 100.00, // Valor do pedido
                Data_Inicio_Pedido__c = Date.today(), // Data de início do pedido
                Prazo_Meses__c = '3' // Prazo do pedido em meses
            );
            testOrders.add(testOrder);
        }
        insert testOrders;
        
        Test.startTest();
        // Execute o lote
        DeleteOldOrdersBatch batchJob = new DeleteOldOrdersBatch();
        Database.executeBatch(batchJob);
        Test.stopTest();
        
        // Verificação - Verifique se os registros antigos foram deletados corretamente
        List<Order__c> remainingOrders = [SELECT Id FROM Order__c];
        System.assertEquals(0, remainingOrders.size(), 'Os pedidos antigos não foram excluídos corretamente.');
    }
}
