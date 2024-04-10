public class Five9RetrieveCOPY {
    
public static String logFive9Supervisor(){
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
            system.debug('body:'+res.getBody());
    
  			JSONPARSER parser = JSON.createParser(res.getBody());
    while (parser.nextToken() != null){
        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
            (parser.getText() == 'tokenId')){
            parser.nextToken();
            tokenId = parser.getText();                
    	}
       
       }
	//Second REQUEST
	
	HttpRequest req1 = new HttpRequest();
      req1.setMethod('PUT');
      req1.setHeader('Cookie',
                     	'Authorization=Bearer-'+tokenId+';'+
                     	'TS01f44108=018ee3e8156b50bc33fbf06cba1b2265704e7c9edee51e9a07de02fde3a3796660a4d3cf07ee2eadf702264cbc609bc4ed0f819220602077a763be88b24818765da41c52b5f590d30d1f28b1e1c08a5ef0bce832939a75dec9b050828debbc02b48678848e;'+
                     	'apiRouteKey=SCLAPIXvAn;'+
                     	'app_key=F9; f9-sessionId=11394d2bf7ac2b4a1b50ef8c57a188f62f2871a176f1db7d317536884ec44c2c;'+
                    	'farmId=51;'+'uiRouteKey=SCLUIjqu15;'+
                     	'BIGipServer~VCC-WEB-INFRASTRUCTURE~SCLSUPojoA=!0Wt8j4dieEH+eWNG48hlVTk2liiIAHX2+3csOrtGPB/ccWS80fUOnkXE4n3cSF9iSYs0cnS2kq8s5NM=;'+
                     	'TS01582219=018ee3e815b94a7b4b3649b892247eae50b0c6e281cd78ca10cd95d0dd0cdb56701bffc6babe0b2002c6f3dd09d3465a94486f93323689aa7d8f410cc62f0e0c2abfc7103c'
                     );
      req1.setHeader('Content-Type','application/json');
    req1.setBody ('{"stationId": 5125679","stationType": "SOFTPHONE"}');
      req1.setEndpoint('https://app-scl.five9.com/supsvcs/rs/svc/supervisors/4764534/session_start?force=true');  			
        	
   		Http http1 = new Http();
        HttpResponse res1;
    		String tokenId1;
    		res1 = http.send(req1);
            system.debug('body:'+res1.getBody());
	
return tokenId1;
}
}