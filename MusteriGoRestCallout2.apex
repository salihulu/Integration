public class MusteriGoRestCallout {
    
    
    public static void retriveMusteri(){
        
        // Instantiate a new Http object
        Http http = new Http();
        
        // Instantiate a new HTTP request
        // Specify request properties such as the endpoint, the POST method, etc. 
        HttpRequest request = new HttpRequest();
        
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
        // request.setBody(body)
        
        HttpResponse response = http.send(request);
        
        system.debug('response.getBody() ::::>> ' + response.getBody() );        
        /*
        response.getBody() ::::>> [
        {"id":1351816,"name":"Anish Abbott","email":"abbott_anish@kozey-marvin.example","gender":"female","status":"active"},
        {"id":1351815,"name":"Sharda Guneta","email":"sharda_guneta@koss.test","gender":"male","status":"active"},
        {"id":1351814,"name":"Ujjawal Malik&quot 
        
        */
        system.debug(' response.getHeaderKeys() ::::>> ' +  response.getHeaderKeys()); 
        /*
        response.getHeaderKeys() ::::>> (x-pagination-limit, x-pagination-page, Server, x-links-previous, vary, x-frame-options, x-download-options, x-links-next, Report-To, referrer-policy, ...)      
        */
        system.debug(' response.getHeaderKeys().size()  ::::>> ' +  response.getHeaderKeys().size() );  //  response.getHeaderKeys().size() ::::>> 28
        
        system.debug(' response.getStatusCode() ::::>> ' +  response.getStatusCode() );   
        //  response.getStatusCode() ::::>> 200
    }
    
}
