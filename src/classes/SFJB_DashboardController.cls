public without sharing class SFJB_DashboardController {
    public String RecordId { get; set; }
    public Site_User__c SiteUser { get; set; }
    public List<SFJB_FieldLabelApiNameMapping> lstFieldMappings { get; set; }
    public List<SFJB_TablePaginationActions> LstPageActions { get; set; }
    Public List<Job__c> LstContacts { get; set; }
    public SFJB_DashboardController(){
        // empty controller
    }
    public PageReference GetLoggedInUser(){
        System.Cookie newCookie = ApexPages.currentPage().getCookies().get('rec_id');
        if(newCookie != null && newCookie.getValue() != ''){
			RecordId = newCookie.getValue();
            List<Site_User__c> lstSiteUsers = [SELECT Id, First_Name__c, Last_Name__c FROM Site_User__c WHERE Id =: RecordId];
            SiteUser = lstSiteUsers[0];
            lstFieldMappings = new List<SFJB_FieldLabelApiNameMapping>();
            lstFieldMappings.add(new SFJB_FieldLabelApiNameMapping('Job Title','Name'));
            lstFieldMappings.add(new SFJB_FieldLabelApiNameMapping('Job Description','Description__c'));
            lstFieldMappings.add(new SFJB_FieldLabelApiNameMapping('Contact Person','Job_Manager__r.Name'));
            lstFieldMappings.add(new SFJB_FieldLabelApiNameMapping('Skills Required','Skills_Required__c'));
            
            LstPageActions = new List<SFJB_TablePaginationActions>();
            LstPageActions.add(new SFJB_TablePaginationActions('View', 'www.google.com'));
            LstPageActions.add(new SFJB_TablePaginationActions('Edit', 'www.google.com'));
            LstContacts = [SELECT Name, Description__c, Job_Manager__r.Name, Skills_Required__c FROM Job__c];
        }
        else
            return Page.SFJB_Login;
        return null;
    }
    public PageReference Logout(){
        List<System.Cookie> cookies = new List<System.Cookie>();
        cookies.add(new Cookie('rec_id', '', null, -1, false));
        PageReference newPage = Page.SFJB_Login;
        newPage.setCookies(cookies);
        return newPage;
    }
    public PageReference PageRefresh(){
        return null;
    }
}