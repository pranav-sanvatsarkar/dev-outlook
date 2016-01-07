public class SFJB_DashboardController {
    public String RecordId { get; set; }
    public SFJB_DashboardController(){
        System.Cookie newCookie = ApexPages.currentPage().getCookies().get('rec_id');
        if(newCookie != null)
        	RecordId = newCookie.getValue();
    }
}