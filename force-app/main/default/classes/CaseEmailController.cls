public class CaseEmailController {
    
    public List<Case> cases { get; set; }
    public String recipientId { get; set; }
    public String relatedToId { get; set; }
    
    public CaseEmailController() {
        recipientId = ApexPages.currentPage().getParameters().get('recipientId');
        relatedToId = ApexPages.currentPage().getParameters().get('relatedToId');
        system.debug('Recipient ID is: ' + recipientId);
        system.debug('Related To ID is: ' + relatedToId);
        
        if(relatedToId != null && relatedToId != '') {
            list<Contact> contacts = [Select id, FirstName from Contact where Id =: relatedToId];
            if(contacts.size()>0){
                cases = [SELECT Id, Subject, CaseNumber, Status, contactId 
                         FROM Case WHERE contactId =: contacts[0].id ];
            }
            
            system.debug('List of cases: ' + cases);
        } 
        
        //else {
         //   cases = new List<Case>();
       //}
    }
}