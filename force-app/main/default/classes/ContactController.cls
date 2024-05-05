public class ContactController {
    private ApexPages.StandardController standardController;
    
    public String Nome { get; set; }
    public String Sobrenome { get; set; }
    public String Cargo {get; set;}
    public String Telefone {get; set;}
    public String Celular { get; set; }
    public String Departamento { get; set; }
    
     public ContactController(ApexPages.StandardController controller) {
        this.standardController = controller;
    }
    public void salvarContact() {
        try{
            if (String.isBlank(Nome) || String.isBlank(Sobrenome)) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Por favor, preencha os campos Nome e Sobrenome.'));
                return;
            }
            Contact objContact = new Contact();
            objContact.FirstName = Nome;
            objContact.Lastname = Sobrenome;
            objContact.Title = Cargo;
            objContact.Phone = Telefone;
            objContact.MobilePhone = Celular;
            objContact.Department = Departamento;
            
            insert objContact;
            
            Nome = null;
            Sobrenome = null;
            Cargo = null;
            Telefone = null;
            Celular = null;
            Departamento = null;
            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Cadastro realizado com sucesso!'));
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Erro ao salvar o cadastro: ' + e.getMessage()));
        }
    }
}