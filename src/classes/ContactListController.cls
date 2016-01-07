public class ContactListController {
	@AuraEnabled
    public static List<Contact> getContacts(){
        return [SELECT Id, Name, Phone, Email FROM Contact ];
    }
}