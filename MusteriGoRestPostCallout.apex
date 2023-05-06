public class MusteriGoRestPostCallout {
   
      private static final string END_POINT = 'https://gorest.co.in/public/v2/users/';
    
    @future(callout=true)
     public static void musteriPostKaydet(String isim , string musteriEmail ){
        
       
        Http http = new Http();  //  yeni http olustruduk
      
        HttpRequest request = new HttpRequest();   // yeni request olusturduk
        
        request.setMethod('POST');   // karsi database record eklemek icin methodumuz  POST olmak zorundadir
        request.setEndpoint(END_POINT+'?name='+ isim + '&email=' + musteriEmail +'&status=active&gender=male');
                             // https://gorest.co.in/public/v2/users/    ?name=   Resul yeni   &email=   dsfsafsad@dfsaf  &status=active&gender=male
        
        //  asagidaki iki satir go rest icin gerekli olan Authorization yapilmasi icin yazildi 
         request.setHeader('Authorization', 'Bearer xxxx'); 
         request.setHeader('Content-Type', 'application/json; charset=utf-8');
     
        // request.setBody(body)
        
        HttpResponse response = http.send(request);   // requestimizi gonderdik ve gelen kismi response icine kaydeddik.
        
      
       
        if( response.getStatusCode() == 201 ){
       
           // String jsonBody = response.getBody();   //  gelen response icindeki bodyi json formationda kaydettik
         
            system.debug(' karsiya kayit oldu');
            
            
        }else{
            System.debug(' kodda hata var kardes  bir incele' + response.getStatusCode() );
        }
    }
}
