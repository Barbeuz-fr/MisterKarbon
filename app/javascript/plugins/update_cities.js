


(function() {
  $(function() {
    console.log("test update_cities");
    return $(document).on('change', '#countries_select', function(evt) {
      console.log("test 2");
      // Recuperer les noms de ville pour le pays selectionné
      // bouche sur new_mist qui ajoute <option>ville</option>
      // Si faisable, voir : https://stackoverflow.com/questions/3155090/how-to-access-an-instance-variable-inside-a-javascript-function-in-ruby-on-rails
      // new_list = "<option>test2</option><option>test3</option>";
      return $("#cities_select").empty().append("<%= escape_javascript(options_for_select(@cities)) %>");
    });
  });

}).call(this);


// (function() {
//   console.log("test update_cities");

//   $("#cities_select").empty().append("<%= escape_javascript(render(:partial => @cities)) %>");

// }).call(this);


// <option>test</option>
