/*
 * 
*/
public class RelatedCasesController {
    public String relatedToId { get; set; }
    public String recipientId { get; set; }
    
    private List<Case> cases;
    
    public List<Case> getRelatedCases() {
        if(cases == null) {
            cases = [SELECT Id, CaseNumber, Status, Subject, CreatedDate FROM Case WHERE ContactId = :relatedToId ORDER BY CreatedDate DESC];
        }
        return cases;
    }
}