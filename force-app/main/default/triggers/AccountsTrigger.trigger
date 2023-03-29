trigger AccountsTrigger on Account (before insert , before delete , before update , after insert , after delete , after update) {
    fflib_SObjectDomain.triggerHandler(Accounts.class);
}