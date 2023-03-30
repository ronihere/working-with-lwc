public with sharing class Accounts extends fflib_SObjectDomain {
    //by default
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    
    //by default
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<sObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }

    
    public override void onApplyDefaults() {
    // Apply defaults to Opportunities
        for(Account acct : (List<Account>)Records){
            acct.Description = 'Domain classes rock!';
        }
    }

    public override void onBeforeInsert(){
        onApplyDefaults();//Implement defaulting logic that executes when a record is inserted and sets the Description field to the value Domain classes rock!
    }


    public override void onBeforeUpdate(Map<Id,SObject> existingRecords){//Implement update logic that calculates the Levenshtein distance between the phrase Domain classes rock! and whatever the contents of the Description field is when an Account is updated. Use the Apex String method getLevenshteinDistance(stringToCompare) and store the result in the Annual Revenue field.
        
        List<Account> toBeUpdated = new List<Account>();

        for(Account acct : (List<Account>)Records){
            if(acct.Description == null){
                acct.Description ='hola';
            }
            acct.AnnualRevenue = ('Domain classes rock!').getLevenshteinDistance(acct.Description);
            toBeUpdated.add(acct);
        }

        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Account.SObjectType});
        uow.registerDirty(toBeUpdated);
    }

}