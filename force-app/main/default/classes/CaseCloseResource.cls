@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    @HttpPost
    global static void closeCase(String reason) {
        // Parse context
        RestRequest req = RestContext.request;
        String[] uriParts = req.requestURI.split('/');
        Id CaseId = uriParts[2];
        // Call the service
        CaseService.closeCases(
            new Set<Id> {CaseId}, reason);     
    }   
}