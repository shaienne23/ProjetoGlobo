@RestResource(urlMapping='/insertOrder/*')
global with sharing class OrderInsert {
    // Classe para os dados do pedido
    public class OrderInserts {
        public String Name; // Nome do pedido
        public String AccountId; // ID da Conta associada ao pedido
        
        // Construtor padrão
        public OrderInserts() {}
    }

    // Método para inserir um pedido
    @HttpPost
    global static String insertOrder(String orderJSON) {
        try {
            OrderInserts orderInserts = (OrderInserts) JSON.deserialize(orderJSON, OrderInserts.class);
            
            // Verifica se os campos obrigatórios estão presentes
            if (String.isBlank(orderInserts.Name) || String.isBlank(orderInserts.AccountId)) {
                return 'Erro: O campo Nome e Conta são obrigatórios.';
            }
            
            // Verifica se a Conta associada existe e se o usuário tem permissão para acessá-la
            Account acc;
            if (orderInserts.AccountId != null && orderInserts.AccountId != '') {
                if (!Schema.sObjectType.Account.isAccessible()) {
                    return 'Erro: O usuário não tem permissão para acessar a conta.';
                }
                
                acc = [SELECT Id, Name FROM Account WHERE Id = :orderInserts.AccountId LIMIT 1];
                if (acc == null) {
                    return 'Erro: A Conta associada não existe.';
                }
            }
            
            // Crie o pedido
            Order newOrder = new Order(
                Name = orderInserts.Name,
                AccountId = orderInserts.AccountId
            );
            
            insert newOrder;
            
            return 'Pedido inserido com sucesso';
        } catch (Exception e) {
            return 'Erro ao inserir pedido: ' + e.getMessage();
        }
    }
}
