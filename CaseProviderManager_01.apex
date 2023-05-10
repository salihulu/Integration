@RestResource(UrlMapping='/cases/*')

global class CaseProviderManager {
    
    @HttpGet
    global static List<Case> provideRecordList(){
        list<case> caseList = [SELECT Id, Status, Subject, Origin, CaseNumber, Reason FROM Case LIMIT 3];
       
        // Karsi tarafa verilecek adres icin anonymous  Sorgu
        // System.debug(System.Url.getSalesforceBaseUrl());
        // [delegate=https://ulu-dev-ed.develop.my.salesforce.com]
        // 
        // Karsiya verilecek adrese /service/apexrest   ve   /cases  eklenmeli
        // https://ulu-dev-ed.develop.my.salesforce.com/services/apexrest/cases
        
        //	Karsiya Verilecek Token
        //	gecici token (Kod yazarken postmane test yaparken kullanilacak, calismayi kontrol etmek icin kullanacagimiz token)
        //	System.debug(System.UserInfo.getSessionId().substring(15));
        //	
        //	!AQsAQIsDciOwsU_ZPt64FGCKhx5FYFikYgWA5yycUb0QfdzayKVSLche3T_lBV6u1QiKIQ95DjYz8lZbmdMqkfOYAdns
        //	
        //	kalici token (artik kod tamamlanip calisan koddan sonra karsiya verilecek kalici token)

        
        return caseList;
    }

}
