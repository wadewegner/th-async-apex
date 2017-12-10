@isTest
private class LeadProcessorTest {
 
  @testSetup
  static void setup() {
    List<Lead> leads = new List<Lead>();

    for (Integer i=0;i<200;i++) {
      leads.add(new Lead(lastname='Lead '+i, company='Company '+i));
    }

    insert leads;
  }

  static testmethod void test() {        
    Test.startTest();
    LeadProcessor leadProcessor = new LeadProcessor();
    Id batchId = Database.executeBatch(leadProcessor);
    Test.stopTest();

    System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
  }
}