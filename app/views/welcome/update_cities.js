// Coffee syntax - original


// console.log("test")

// console.log("test update_cities.coffee")
// $("#cities_select").empty()
//   .append("<%= escape_javascript(render(:partial => @cities)) %>")


// JS syntax - original

// (function() {
//   console.log("test update_cities.js");

//   document.getElementById("#cities_select").empty().append("<%= escape_javascript(render(:partial => @cities)) %>");

// }).call(this);


//  JS syntax retravaillée

// (function() {
//   $(function() {
//     console.log("test update_cities");
//     return $(document).on('change', '#countries_select', function(evt) {
//       console.log("test 2");
//       return $("#cities_select").empty().append("<%= escape_javascript(render(:partial => @cities)) %>");
//     });
//   });

// }).call(this);
