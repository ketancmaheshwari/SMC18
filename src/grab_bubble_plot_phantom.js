 var page = require('webpage').create();
 page.open('http://localhost:8888', function(status) {
   console.log("Status: " + status);
   if(status === "success") {
     page.render("1803.png");
   }
   phantom.exit();
 });
