public class AccountTriggerHandler {

    public static void updateRating(List<Account> newAccounts){
        for(Account acc: newAccounts){
            if(acc.Industry == 'Media'){
                acc.description = 'Hot';
            }
        }
    }

    //trigger no 3
    public static void handleCopyBillingToShipping(List<Account> newAccounts){
        for(Account acc: newAccounts){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingGeocodeAccuracy = acc.BillingGeocodeAccuracy;
                acc.ShippingLatitude = acc.BillingLatitude;
                acc.ShippingLongitude = acc.BillingLongitude;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
        }
    }
}