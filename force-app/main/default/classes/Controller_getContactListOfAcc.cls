public with sharing class Controller_getContactListOfAcc {
  @AuraEnabled
  public static List<Contact> getContactList(
    String recorId,
    string searchQuery
  ) {
    try {
      if (searchQuery != null && searchQuery != '') {
        String search = '%' + searchQuery + '%';
        List<Contact> conList = [
          SELECT ID, Name, Phone
          FROM Contact
          WHERE AccountId = :recorId AND Name LIKE :search
        ];
        return conList;
      } else {
        List<Contact> conList = [
          SELECT ID, Name, Phone
          FROM Contact
          WHERE AccountId = :recorId
        ];
        if (conList.size() > 0) {
          return conList;
        } else {
          return null;
        }
      }
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
