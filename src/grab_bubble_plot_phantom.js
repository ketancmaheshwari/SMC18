 var page = require('webpage').create();
 page.open('http://localhost:8888', function(status) {
   console.log("Status: " + status);
   if(status === "success") {
     page.render("2017.png");
   }
   phantom.exit();
 });
