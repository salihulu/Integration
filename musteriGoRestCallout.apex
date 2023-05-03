//Class
public class musteriGoRestCallout {
    
    public static void retriveMusteri(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');
       
        HttpResponse response = http.send(request);
        
        System.debug('Response.getBody() ::::> ' + Response.getBody()); 
        
        /*
        [
		{"id":1366945,"name":"Balaaditya Acharya","email":"acharya_balaaditya@prosacco.example","gender":"female","status":"inactive"},			
		{"id":1366939,"name":"Gayatri Abbott","email":"abbott_gayatri@kohler-lemke.test","gender":"male","status":"active"},
		{"id":1366938,"name":"Da 
         */

         System.debug('Response.getHeaderKeys() ::::> ' + Response.getHeaderKeys()); 
         System.debug('Response.getHeaderKeys().size() ::::> ' + Response.getHeaderKeys().size());         
         System.debug('Response.getStatusCode() ::::> ' + Response.getStatusCode()); 
           
        
    }

}
