public class CaseTriggerDispatcher {

    public static void run(System.TriggerOperation operationType) {    
        if (operationType == System.TriggerOperation.BEFORE_INSERT) {
            CaseTriggerHandler.handleBeforeInsert(Trigger.New);
        } else if (operationType == System.TriggerOperation.AFTER_INSERT) {
            CaseTriggerHandler.handleAfterInsert(Trigger.New);
        } else if (operationType == System.TriggerOperation.BEFORE_UPDATE) {
            CaseTriggerHandler.handleBeforeUpdate(Trigger.New,Trigger.OldMap);
        } else if (operationType == System.TriggerOperation.AFTER_UPDATE) {
            CaseTriggerHandler.handleAfterUpdate(Trigger.New, Trigger.OldMap);
        } else if (operationType == System.TriggerOperation.BEFORE_DELETE) {
        } else if (operationType == System.TriggerOperation.AFTER_DELETE) {
        } else if (operationType == System.TriggerOperation.AFTER_UNDELETE) {
        } else {
            // Add default logic or error handling
        }
    }
}