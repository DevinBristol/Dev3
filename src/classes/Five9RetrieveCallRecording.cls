public class Five9RetrieveCallRecording {
    
public static String logFive9Supervisor(){

        String auth;
        String sessionId;
        String TS01582219;
        String TS01f44108;
        String Cookies;
        String Infrastructure;

    // first Request

   HttpRequest req = new HttpRequest();
      req.setMethod('POST');
      req.setHeader('Content-Type','application/json');
	  req.setHeader('Connection', 'keep-alive');
      req.setBody ('{"passwordCredentials":{"username":"syncerfn@gmail.com","password": "Alpha10Gas!"},"policy":"ForceIn"}');
      req.setEndpoint('https://app.five9.com/supsvcs/rs/svc/auth/login');  			
        	
   		Http http = new Http();
        HttpResponse res;
    		String tokenId;
    		res = http.send(req);
            String cookies2;
            cookies2 = cookies2 + res.getheader('Set-Cookie');
            cookies2 = cookies2.substringAfter('null');
            TS01f44108 = res.getHeader('Set-Cookie');
            system.debug('body:'+res.getBody());
            TS01f44108 = TS01f44108.substringBefore(';');
            TS01f44108 = TS01f44108.substringAfter('=');
            Infrastructure = cookies2.substringBetween('BIGipServer',';');
            TS01582219 = cookies2.substringBetween('TS01582219=',';');
            system.debug('Infrastructure:::'+ Infrastructure);
            system.debug('TS01f44108:::'+TS01f44108);
            system.debug('cookies2:::'+cookies2);


  			JSONPARSER parser = JSON.createParser(res.getBody());
    while (parser.nextToken() != null){
        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
            (parser.getText() == 'tokenId')){
            parser.nextToken();
            tokenId = parser.getText();
    	}
        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                (parser.getText() == 'sessionId')){
            parser.nextToken();
            sessionId = parser.getText();
        }

    }

    cookies = 'Authorization=Bearer-'+tokenId+'; TS01f44108='+TS01f44108+'; apiRouteKey=SCLAPIXvAn; app_key=F9; f9-sessionId='+sessionId+'; farmId=51; uiRouteKey=SCLUIjqu15; BIGipServer'+Infrastructure+'; TS01582219='+TS01582219+'';
        system.debug('cookies:::'+cookies);
	//Second REQUEST
	
	HttpRequest req1 = new HttpRequest();
      req1.setMethod('PUT');
      req1.setHeader('Content-Type','application/json');
      req1.setHeader('Connection', 'keep-alive');
      req1.setHeader('Cookie',cookies2);
      req1.setBody ('{"stationId": 5125679","stationType": "SOFTPHONE"}');
      req1.setEndpoint('https://app-scl.five9.com:443/supsvcs/rs/svc/supervisors/4764534/session_start?force=true');
       
   		Http http1 = new Http();
        HttpResponse res1;
    		String tokenId1;
    		res1 = http.send(req1);
            system.debug('body:'+res1.getBody());

return sessionId;
}
}