@isTest
private class AgendamentoDeletarPedidosTest {
    @isTest
    static void testExecute() {
        // Preparação
        Test.startTest();
        AgendamentoDeletarPedidos scheduledJob = new AgendamentoDeletarPedidos();
        SchedulableContext context = null; // Você pode criar um contexto de teste se necessário
        
        // Execução
        scheduledJob.execute(context);
        Test.stopTest();
        
        // Verificação - Adicione verificações a
    }}