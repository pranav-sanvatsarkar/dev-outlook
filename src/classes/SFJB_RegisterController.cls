public class SFJB_RegisterController {
    public Site_User__c SiteUser { get; set; }
    public SFJB_RegisterController(){
        SiteUser = new Site_User__c();
    }
    public PageReference SaveAndNextStep1(){
        if( SiteUser.RecordTypeId == null )
        	SiteUser.RecordTypeId = Schema.SObjectType.Site_User__c.getRecordTypeInfosByName().get('Candidate').getRecordTypeId();
        SiteUser.Name = SiteUser.First_Name__c + ' ' + SiteUser.Last_Name__c;
        SiteUser.Username__c = SiteUser.Email__c;
        return Page.SFJB_Register_Step_2;
    }
    public PageReference SaveAndNextStep2(){
        try{
            insert SiteUser;
            return Page.SFJB_Register_Step_3;
        }
        catch(Exception ex){
            ApexPages.Message errMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage());
            ApexPages.addMessage(errMsg);
        }
        return null;
    }
    public PageReference SaveAndNextStep3(){
        return Page.SFJB_Login;
    }
    public PageReference PreviousStep1(){
        if( SiteUser.Id != null )
        	delete SiteUser;
        return Page.SFJB_Login;
    }
    public PageReference PreviousStep2(){
        return Page.SFJB_Register_Step_1;
    }
}