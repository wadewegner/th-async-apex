@isTest
public class DailyLeadProcessorTest {
    
  @isTest
  public static void testing() {
      
    List<lead> leads = new List<lead>();
    for(Integer i=0; i<200; i++) {
      lead l = new lead();
      l.lastname = 'lastname'+i;
      l.Company = 'company'+i;
      leads.add(l);
    }
    insert leads;
    
    Test.startTest();

    DailyLeadProcessor dlp = new DailyLeadProcessor();
    String jobId = System.Schedule('dailyleadprocessing','0 0 0 1 10 ? 2018', dlp);
    
    Test.stopTest();
    
    List<lead> leadsCheck = new List<lead>([select id, leadsource from lead where leadsource != 'Dreamforce']);
    System.assertequals(0, leadsCheck.size());
  }
}