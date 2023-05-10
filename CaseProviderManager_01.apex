@RestResource(UrlMapping='/cases/*')

global class CaseProviderManager {
    @HttpGet
    global static List<case> provideRecordList(){
        list<case> caseList = [SELECT CaseNumber,  Status, Origin, Subject, Reason FROM Case LIMIT 3 ];
        
        /*
        bizden data isteyen systeme verecegimiz ENDUSER icin komut
        System.debug(System.Url.getSalesforceBaseUrl());
        // [delegate=https://wisequarter144-dev-ed.develop.my.salesforce.com]
        bizim karsi tarafa verecegimiz end user
        https://wisequarter144-dev-ed.develop.my.salesforce.com/services/apexrest/cases
                         Cases
         */
         
        /*  karsi tarafa verecegimiz token
        1. siz  gecici parala( token )
        kod yazarken pstmana verip yazzdigimiz kodlarin calismasini kontrol ederiz
        System.debug(System.UserInfo.getSessionId().substring(15));
        // !ARcAQJG05M.VI4kcNhAXVRg0qZPmnrtb05Iu7f8lOBuNvq4F96eD2AukGmypkErE_mh8AoJq29Pc7gZsqXuYtgn6w4x2E71Y
        2. kalici token   artik sasglam koddan sonra karsi firmaya verilir
        */
        
        return caseList;
    }
}
