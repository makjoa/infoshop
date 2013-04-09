function sendSns(type) {
  // set up default options 
  var defaults = { 
    version:    '2.0.1', 
    login:      'leecom', 
    apiKey:     'R_514bf4ccbd42c5aa4049dc15e635b058', 
    history:    '0'
  }; 
  
  encode_longUrl = encodeURIComponent(longUrl);
  title = title.replace('&','%26');
 
  // Build the URL to query 
  var daurl = "http://api.bit.ly/shorten?" 
    +"version="+defaults.version 
    +"&longUrl="+encode_longUrl 
    +"&login="+defaults.login 
    +"&apiKey="+defaults.apiKey 
    +"&history="+defaults.history 
    +"&format=json&callback=?"; 
    // Utilize the bit.ly API 
    $.getJSON(daurl, function(data){ 
 
        // Make a good use of short URL 
 
			
			var url = data.results[longUrl].shortUrl; 
 
            switch(type){
 
              case "tw":
              var sendUrl = "http://twitter.com/?status="+title+"+"+url;
			  window.open(encodeURI(sendUrl));
              break;
 
 
              case "fa":
              var sendUrl ="http://www.facebook.com/sharer.php?u="+url+"&t="+title;
			  window.open(encodeURI(sendUrl));
              break;
 
           }
 
    }); 
};