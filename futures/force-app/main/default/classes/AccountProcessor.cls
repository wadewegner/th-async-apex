public class AccountProcessor {

  @future
  public static void countContacts(List<Id> accountIds) {

    List<Account> acctsToRollup = new List<Account>();

    for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                              FROM Contact 
                              WHERE AccountId in: accountIds 
                              GROUP BY AccountId]){

      Account a = new Account();
      a.Id = (Id) ar.get('AcctId');
      a.Number_of_Contacts__c = (Integer) ar.get('ContactCount');
      acctsToRollup.add(a);
    }

    update acctsToRollup;
  }
}