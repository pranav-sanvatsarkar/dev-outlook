public class RecordTypeCheckerController{
    public string strRecordType { get; set; }
    public RecordTypeCheckerController(){
        strRecordType = ApexPages.CurrentPage().getParameters().get('id');
        List<Campaign> lstCampaigns = [ SELECT toLabel(RecordType.Name) FROM Campaign WHERE Id=: strRecordType]; 
        strRecordType = lstCampaigns[0].RecordType.Name;
    }
}