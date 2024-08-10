trigger accountTrigger on Account (before insert) {
	
    If(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateRating(Trigger.New);
            AccountTriggerHandler.handleCopyBillingToShipping(Trigger.New);
        }
    }
}