public class CaseTriggerHandler {

    public static void handleBeforeInsert(List<SObject> newCasesBeforeInsert){
		CaseTriggerHelper.duplicateCaseManagment(newCasesBeforeInsert);    
    }
    
    public static void handleAfterInsert(List<SObject> newCasesAfterInsert){
        
    }
    
    public static void handleBeforeUpdate(List<SObject> casesBeforeUpdate, Map<Id,SObject> oldCases){
        
    }
    
    public static void handleAfterUpdate(List<SObject> casesAfterUpdate, Map<Id,SObject> oldCases){
       // CaseTriggerHelper.calculatedTime(CasesAfterUpdate, oldCases);
    }
}