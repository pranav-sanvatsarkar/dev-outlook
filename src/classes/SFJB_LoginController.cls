public with sharing class SFJB_LoginController {
    public String Username { get; set; }
    public String Password { get; set; }
    public SFJB_LoginController(){
        // empty controller
    }
    public PageReference Login(){
        List<Site_User__c> lstUsers = [SELECT Id, First_Name__c, Last_Name__c, Username__c, Password__c FROM Site_User__c WHERE Username__c =: Username AND Password__c =: Password ];
        if( !lstUsers.isEmpty() ){
        	PageReference newPage = new PageReference(Page.SFJB_Register.getUrl());
            newPage.getParameters().put('id', lstUsers[0].Id);
            return newPage;    
        }
        else{
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Username or password is incorrect!');
            ApexPages.addMessage(errMsg);
            return null;
        }
        
    }
    public PageReference Register(){
        return Page.SFJB_Register;
    }
}