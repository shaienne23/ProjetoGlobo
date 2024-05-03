@RestResource(urlMapping='/OrderInsert/*')
global with sharing class OrderInsert {

    @HttpPost
    global static String insertOrder(String accountId, String orderName, String  orderValor, String orderData, String orderPrazo) {
        try {
            // Verifica se os campos obrigatórios estão presentes
            if (String.isBlank(orderName) || String.isBlank(accountId)) {
                return 'Erro: O campo Nome e Conta são obrigatórios.';
            }
            
            // Verifica se a Conta associada existe e se o usuário tem permissão para acessá-la
            Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
            if (acc == null) {
                return 'Erro: A Conta associada não existe.';
            }
            
            // Cria o pedido
              Order__c newOrder = new Order__c(
                Name = orderName,
                Conta__c = accountId,
                Valor_Total_Pedido__c = Decimal.valueOf(orderValor),
                Data_Inicio_Pedido__c = Date.valueOf(orderData),
                Prazo_Meses__c = orderPrazo
            );
            
            insert newOrder;
            
            return 'Pedido inserido com sucesso';
        } catch (Exception e) {
            return 'Erro ao inserir pedido: ' + e.getMessage();
        }
    }
}