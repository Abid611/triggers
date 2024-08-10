public with sharing class opportunityTriggerHandler {
    
    public static void handleHotOpportunity(List<Opportunity> newOpportunity){

        for(Opportunity op: newOpportunity){

            if(op.Amount != null && op.Amount >= 100000){
                op.Description = 'Hot';
            }
        }
    }
}