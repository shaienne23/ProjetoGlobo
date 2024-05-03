@isTest
private class OrderInsertTest {
    @isTest
    static void testInsertOrder() {
        // Crie uma conta de teste
        Account acc = new Account(Name = 'Conta de Teste');
        insert acc;

        // Chame o método insertOrder com parâmetros válidos
        String result = OrderInsert.insertOrder(acc.Id, 'Pedido de Teste', '100.00', '2024-05-03', '6');

        // Verifique se o resultado é a mensagem esperada
        System.assertEquals('Pedido inserido com sucesso', result);
    }

@isTest
static void testInsertOrderComContaInvalida() {
    // Chame o método insertOrder com um ID de conta inválido
    String result = OrderInsert.insertOrder('001invalidId', 'Pedido de Teste', '100.00', '2024-05-03', '6');

    // Verifique se o resultado contém a mensagem de erro esperada
    System.assert(result.contains('Erro ao inserir pedido'));
}
    @isTest
    static void testInsertcomCamposEmBranco() {
        // Chame o método insertOrder com campos em branco
        String result = OrderInsert.insertOrder('', '', '100.00', '2024-05-03', '6');

        // Verifique se o resultado é a mensagem de erro esperada
        System.assertEquals('Erro: O campo Nome e Conta são obrigatórios.', result);
    }
}