public class MusteriGoRestCallout {    
    public static void retriveMusteri(){
        
        // Instantiate a new Http object
        Http http = new Http();
        
        // Instantiate a new HTTP request
        // Specify request properties such as the endpoint, the POST method, etc. 
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users/');
                            //  https://gorest.co.in/public/v2/users/1366917     object recordu donuyor  liste DEGILLL
                            //  https://gorest.co.in/public/v2/users/?id=1366919     LISTE ama liste icinde sadece 1 adet record var
                            //  https://gorest.co.in/public/v2/users/?name=Shanti     liste dondu  icinde namei Shanti olan kisiler var    
                            //  https://gorest.co.in/public/v2/users/?name=Shanti&gender=male   liste donuyor  name    Shanti  ve male olanlar dondu
                            //  https://gorest.co.in/public/v2/users/         BODY ICERINE name = Shanti dedim ve bana name gore filtre yaparak LISTE dondu
        // request.setBody(body)
        
        HttpResponse response = http.send(request);
        
       // system.debug('response.getBody() ::::>> ' + response.getBody() );        
        /*
        response.getBody() ::::>> [
        {"id":1351816,"name":"Anish Abbott","email":"abbott_anish@kozey-marvin.example","gender":"female","status":"active"},
        {"id":1351815,"name":"Sharda Guneta","email":"sharda_guneta@koss.test","gender":"male","status":"active"},
        {"id":1351814,"name":"Ujjawal Malik&quot 
        
        */
       // system.debug(' response.getHeaderKeys() ::::>> ' +  response.getHeaderKeys()); 
       
       // system.debug(' response.getHeaderKeys().size()  ::::>> ' +  response.getHeaderKeys().size() );  //  response.getHeaderKeys().size() ::::>> 28
        
        // system.debug(' response.getStatusCode() ::::>> ' +  response.getStatusCode() );   
        //  response.getStatusCode() ::::>> 200
       
        if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
           /*
               public class musteriContainer {
            
                public string id; 
                public string name;
                public string email;
                public string gender;
                public string status;
          
            }
            */
            List<musteriContainer> gelenmusteriContainerList =  (List<musteriContainer>)JSON.deserialize(jsonBody, List<musteriContainer>.class);
           // system.debug('List<musteriContainer> gelenmusteriContainerList ::>> ' + gelenmusteriContainerList );
           /*
             List<musteri__c> gelenAccList =  (List<musteri__c>)JSON.deserialize(jsonBody, List<musteri__c>.class);
            List<musteri__c> gelenAccList ::>> 
          (musteri__c:{Id=1351815, Name=Sharda Guneta},
           musteri__c:{Id=1351809, Name=Avadhesh Khatri DDS}, 
           musteri__c:{Id=1351808, Name=Rep. Gaurang Mukhopadhyay}, 
           ****** {Id=13
            */
          
            /*
        List<musteriContainer> gelenmusteriContainerList ::>> 
   (musteriContainer:[email=sharda_guneta@koss.test, gender=male, id=1351815, name=Sharda Guneta, status=active], 
    musteriContainer:[email=dds_khatri_avadhesh@paucek.test, gender=male, id=1351809, name=Avadhesh Khatri DDS, status=active], 
    *****,    
      */
           List<musteri__c> mustList = new List<musteri__c>();
            for(musteriContainer mst : gelenmusteriContainerList ) {
               
                musteri__c yeniMust = new musteri__c();
                
                yeniMust.goRestID__c = mst.id;
                yeniMust.email__c = mst.email;
                yeniMust.status__c = mst.status;
                yeniMust.Name   = mst.name;
           
                mustList.add( yeniMust );
            }
            
            database.insert(mustList);
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
    
   	private static final string END_POINT = 'https://gorest.co.in/public/v2/users/';  
    
    //  https://gorest.co.in/public/v2/users/1366917     object recordu donuyor  liste DEGILLL
    public static void retriveTekMusteri(String musteriId){
        
        // Instantiate a new Http object
        Http http = new Http();
        
        // Instantiate a new HTTP request
        // Specify request properties such as the endpoint, the POST method, etc. 
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint( END_POINT + musteriId);
   
        HttpResponse response = http.send(request);
  
        if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
          
            musteriContainer gelenMusteri =  (musteriContainer)JSON.deserialize(jsonBody, musteriContainer.class);
           
         
                musteri__c yeniMust = new musteri__c();
                
                yeniMust.goRestID__c= gelenMusteri.id;
                yeniMust.email__c = gelenMusteri.email;
                yeniMust.status__c = gelenMusteri.status;
                yeniMust.Name   = gelenMusteri.name;
            
            database.insert(yeniMust);
            
       system.debug('tebrik ederim kayit oldu');            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
    
    //  https://gorest.co.in/public/v2/users/?id=1366919     LISTE ama liste icinde sadece 1 adet record var
    public static void retriveTekMusteriList(String  musteriId){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint(END_POINT+'?id='+ musteriId);
                           
        
        HttpResponse response = http.send(request);
       
        if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
           
            List<musteriContainer> gelenmusteriContainerList =  (List<musteriContainer>)JSON.deserialize(jsonBody, List<musteriContainer>.class);
           
            List<musteri__c> mustList = new List<musteri__c>();
                for(musteriContainer mst : gelenmusteriContainerList ) {
                   
                    musteri__c yeniMust = new musteri__c();
                    
                    yeniMust.goRestID__c = mst.id;
                    yeniMust.email__c = mst.email;
                    yeniMust.status__c = mst.status;
                    yeniMust.Name   = mst.name;
               
                    mustList.add( yeniMust );
                }
            
            database.insert(mustList);
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }

    //  https://gorest.co.in/public/v2/users/?name=Shanti     liste dondu  icinde namei Shanti olan kisiler var    
    //  https://gorest.co.in/public/v2/users/?name=Shanti&status=active   liste donuyor  name    Shanti  ve male olanlar dondu   
    public static void nameVeStatuseGoreMusteriFiltre(string musteriAdi, string durum){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint(END_POINT +'?name='+musteriAdi+'&status='+durum);
        
        HttpResponse response = http.send(request);
        
       if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
 
            List<musteriContainer> gelenmusteriContainerList =  (List<musteriContainer>)JSON.deserialize(jsonBody, List<musteriContainer>.class);
          
           List<musteri__c> mustList = new List<musteri__c>();
            for(musteriContainer mst : gelenmusteriContainerList ) {
               
                musteri__c yeniMust = new musteri__c();
                
                yeniMust.goRestID__c = mst.id;
                yeniMust.email__c = mst.email;
                yeniMust.status__c = mst.status;
                yeniMust.Name   = mst.name;
           
                mustList.add( yeniMust );
            }
            
            database.insert(mustList);
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
    
    //  https://gorest.co.in/public/v2/users/         BODY ICERINE name = Shanti dedim ve bana name gore filtre yaparak LISTE dondu
        public static void retriveMusteriByBody(String isim){

        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint(END_POINT);
        
        String body = 'name='+ isim;
            
        request.setBody(body) ;                   
        
        HttpResponse response = http.send(request);
        
         if( response.getStatusCode() == 200 ){
       
            String jsonBody = response.getBody(); 
           
            List<musteriContainer> gelenmusteriContainerList =  (List<musteriContainer>)JSON.deserialize(jsonBody, List<musteriContainer>.class);
           
           List<musteri__c> mustList = new List<musteri__c>();
            for(musteriContainer mst : gelenmusteriContainerList ) {
               
                musteri__c yeniMust = new musteri__c();
                
                yeniMust.goRestID__c = mst.id;
                yeniMust.email__c = mst.email;
                yeniMust.status__c = mst.status;
                yeniMust.Name   = mst.name;
           
                mustList.add( yeniMust );
            }
            
            database.insert(mustList);
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }

}
