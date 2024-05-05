public with sharing class ContactsController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        try {
            return [SELECT Id, Name, Phone, Title FROM Contact ORDER BY CreatedDate DESC  LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}