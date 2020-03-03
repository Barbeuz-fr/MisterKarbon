// const selectedTeam = () => { $('.dropdown-menu a').click(function () {
//     const team = $('button').text($(this).text());
//     console.log(team);
//   });
// };

// Source : https://stackoverflow.com/questions/53443008/handle-bootstrap-dropdown-event-in-jquery


// Source: http://jsfiddle.net/cmcculloh/xnpf1rr9/
// const updateDropdownValue = () => {
//   $(".dropdown-menu a").click(function(){
//     $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
//     $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
//   });
// };

// const updateDropdownValue = () => {
//     document.getElementById("teamSelectionDropdown").each(function (key, dropdown) {
//         var $dropdown = $(dropdown);
//         $dropdown.find('.dropdown-menu a').on('click', function () {
//             $dropdown.find('button').text($(this).text()).append(' <span class="caret"></span>');
//         console.log($dropdown)
//         });
//     });
// };

  $(".dropdown-menu li a").click(function(){
    $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
    $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
  })

// export { selectedTeam };
// export { updateDropdownValue };
