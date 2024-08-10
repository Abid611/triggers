public class CaseTriggerHelper {
	
    /*
     * Object: Contact
     * Event: Before Insert
     * Requirments:
     * 				if a customer create another case, check by their email id and attached with same account
     * 
     */
    
    public static void duplicateCaseManagment(List<Case> newCases){ 
        Set<String> csEmails = new Set<String>();  
        for(Case cs: newCases){
            if(cs.Email__c != null){
               csEmails.add(cs.Email__c);
            }else{
                system.debug('case email is null');
            }
        }     
        Map<string,Account> accMap = new Map<string,Account>();
        if(!csEmails.isEmpty()){
            for(Account acc: [select Id,
                              Email__c 
                              FROM Account 
                              WHERE Email__c 
                              IN: csEmails]){
            	accMap.put(acc.Email__c,acc);
        	}
        } 
        for(Case cs: newCases){   
            if(cs.Email__c != null && accMap.containsKey(cs.Email__c)){
                cs.AccountId = accMap.get(cs.Email__c).Id;
            }
        } 
    }
    
    /* 
     *Event: After update 
     * 
     * Outcome: To calculate the time of the case taken from opening to closure.
     */
    
    public static void calculatedTime(List<Case> UpdatedCases, Map<Id,Case> oldValues){
        
       List<Case> casesToUpdate  = new List<Case> ();
        
        for(Case cs: UpdatedCases){
            if(cs.Status != oldValues.get(cs.Id).Status && cs.Status == 'Closed' && cs.ClosedDate != null){
                cs.Total_Duration__c = calculateTimeDifference(cs.CreatedDate,  cs.ClosedDate);
                system.debug('res==== '+calculateTimeDifference(cs.CreatedDate,  cs.ClosedDate));
            	casesToUpdate.add(cs);
            }
        }
        
		update casesToUpdate;        
    }
    
     public static Time calculateTimeDifference(DateTime startDateTime, DateTime endDateTime) {
        // Calculate the difference in milliseconds
        Long startMilliseconds = startDateTime.getTime();
        Long endMilliseconds = endDateTime.getTime();
        Long differenceMilliseconds = endMilliseconds - startMilliseconds;
        
        // Convert milliseconds to hours, minutes, and seconds
        Long differenceSeconds = differenceMilliseconds / 1000;
        Integer hours = (differenceSeconds / 3600).intValue();
        Integer minutes = (Math.mod(differenceSeconds, 3600) / 60).intValue();
        Integer seconds = Math.mod(differenceSeconds, 60).intValue();
        
        // Return the result as a Time object
        return Time.newInstance(hours, minutes, seconds, 0);
    }
}