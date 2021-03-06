public class DailyLeadProcessor implements schedulable{
    
  public void execute(schedulableContext sc) {
    List<lead> updatedLeads = new List<lead>();
    List<lead> leads = new List<lead>([select id, leadsource from lead where leadsource = null]);
    
    for(lead l : leads) {
      l.leadsource = 'Dreamforce';
      updatedLeads.add(l);
    }
    update updatedLeads;
  }
}