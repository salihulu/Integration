@RestResource(UrlMapping='/cases/*')
global class CaseProviderManager {
    @HttpGet
    global static List<case> provideRecordList(){
        
        list<case> caseList = [SELECT CaseNumber,  Status, Origin, Subject, Reason FROM Case LIMIT 3 ];
          return caseList;
        /*
       bizden data isteyen systeme verecegimiz ENDUSER icin komut
        System.debug(System.Url.getSalesforceBaseUrl());
      // [delegate=https://ulu-dev-ed.develop.my.salesforce.com]
bizim karsi tarafa verecegimiz end user 
  https://ulu-dev-ed.develop.my.salesforce.com/services/apexrest/cases
                         Cases
*/
        /*  karsi tarafa verecegimiz token 
     
1. siz  gecici parala( token )
kod yazarken pstmana verip yazzdigimiz kodlarin calismasini kontrol ederiz
System.debug(System.UserInfo.getSessionId().substring(15));
// xxxxxxtoken...
2. kalici token   artik sasglam koddan sonra karsi firmaya verilir
*/ 
     
      
        
    }
  
    @HttpDelete
    global static String doDelete() {
        
        RestRequest request = RestContext.request;  //  request icerisinde gelen header ve body kisimlarina ulasmak icin bu satir yazildi.
        
   //     RestResponse res = RestContext.response;  //  response  icerisinde giden header ve body kisimlarina ulasmak icin bu satir yazildi.
            
        //                               /public/v2/users/887
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //    en son  / dan sonraki silmek icin URL de  gondereilen recordun ID sini alamk icin yazildi 
        //    500Dp000003Cd8IIAS
        
        Case silinecekCase = [SELECT Id FROM case WHERE Id = :caseId];
       
        delete silinecekCase;
        
        return ' tebrikler bir record sildiniz';
    }
    
    
     @HttpPost
        global static Case doPost(String origin,String status, String subject) {
          
            Case yeniCase = new Case();
            yeniCase.Status = status;
            yeniCase.Origin = origin;
            yeniCase.Subject = subject;
            
            insert yeniCase;
            
            return yeniCase;
        }  
    
    /*
    {
        "attributes": {
            "type": "Case",
            "url": "/services/data/v57.0/sobjects/Case/500Dp000003Cd8DIAS"
        },
        "CaseNumber": "00001000",
        "Status": "New",
        "Origin": "Phone",
        "Subject": "Starting generator after electrical failure",
        "Reason": "Equipment Complexity",
        "Id": "500Dp000003Cd8DIAS"
    }
*/
    
    
    
    @HttpPut
        global static Case doPut(String origin,String status, String subject , String id) {
          
            Case yeniCase = new Case();
            yeniCase.id= id;             //  put methodu eger record var ise update etmek   eger record yok ise sifirdan record olusturmak icindir
            yeniCase.Status = status;
            yeniCase.Origin = origin;
            yeniCase.Subject = subject;
            
            upsert yeniCase;             //  upsert DML  record var ise update eder  yok ise insert eder
            
            return yeniCase;
        } 
    
    
    @HttpPatch
    global static ID updateCase(){
         RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
          
        Case caseToUpdate = [Select id FROM case WHERE Id=:caseId];
       
        
        
        Map<String,Object> params= (Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        Set<string> mapinKeyleri = params.keyset();
        
        for(String fieldName : mapinKeyleri){
            caseToUpdate.put(fieldName, params.get(fieldName));
            
        }
        update caseToUpdate;
        
        return caseToUpdate.id;
        
    }
    
        
}
