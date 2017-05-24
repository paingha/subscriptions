// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// Initialize paystack object
var paystack;
Paystack.init({
  form: "paystack-card-form", // Form ID
  access_code: 'd5gtr67t'   // You should programmatically pass the access
                              // code via Ajax or a server variable. Note that
                              // the access code can only be used once. 
}).then(function(returnedObj){
  paystack = returnedObj;
}).catch(function(error){
  console.log("There was an error loading Paystack", error);
});

$("#paystack-card-form").submit(function(e){
  e.preventDefault();
  // You are to programmatically pass the pin provided by your custoemr
  // to this function
  // It gets all the card fields from the data-paystack input fields
  paystack.card.charge({
    pin: readPin() // Called a function that returns the optional pin value
  }).then(function(response){
    console.log(response);
  }, function(error){
    console.log(error);
  });
})