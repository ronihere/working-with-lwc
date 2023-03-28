public with sharing class CaseService {
    public static void closeCases(Set<Id> caseIdSet , String reason){
        List<Case> caseListToUpdate;
        List<Case> caseListGotten;
        if(caseIdSet==null || caseIdSet.size()==0){
            throw new OpportunityServiceException('Opportunities not specified.');
        }
        caseListGotten = [SELECT Id ,Reason , Status FROM Case WHERE Id IN :caseIdSet];
        caseListToUpdate = new List<Case>();
        for(Case cs : caseListGotten){
                cs.Reason = reason;
                cs.Status = 'Closed';
                System.debug(cs.Status);
                caseListToUpdate.add(cs);
        }
        SavePoint sp = Database.setSavePoint();
        try {
            update caseListToUpdate;
        } catch (Exception e) {
            // Rollback
            Database.rollback(sp);
            // Throw exception on to caller
            throw e;
        }       
    }
    public class OpportunityServiceException extends Exception {} 
        
}