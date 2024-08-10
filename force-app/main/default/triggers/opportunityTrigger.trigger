trigger opportunityTrigger on Opportunity (before insert) {

    if(Trigger.isInsert){
        If(Trigger.isBefore){
            opportunityTriggerHandler.handleHotOpportunity(Trigger.New);
        }
    }
}