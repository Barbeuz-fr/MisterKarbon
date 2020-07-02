// (function() {
//   $(function() {
//     return $(document).on('change', '#countries_select', function(evt) {
//       return $.ajax('update_cities', {
//         type: 'GET',
//         dataType: 'script',
//         data: {
//           country_id: $("#countries_select option:selected").val()
//         },
//         error: function(jqXHR, textStatus, errorThrown) {
//           return console.log("AJAX Error: " + textStatus);
//         },
//         success: function(data, textStatus, jqXHR) {
//           return console.log("Dynamic country select OK!");
//         }
//       });
//     });
//   });

// }).call(this);

(function() {
  $(document).ready(function() {
    $('#genres_select').change(function() {
      $.ajax({
        url: "<%= update_artists_path %>",
        data: {
          genre_id : $('#genres_select').val()
        },
        dataType: "script"
      });
    });
    $('#artists_select').change(function() {
      $.ajax({
        url: "<%= update_songs_path %>",
        data: {
          artist_id : $('#artists_select').val()
        },
        dataType: "script"
      });
    });
  });
}).call(this);


// (function() {
//   $("#cities_select").empty().append("<%= escape_javascript(render(:partial => @cities)) %>");

// }).call(this);
