const testJs = () => {
  $(document).ready(function() {
    $('[data-js-hide-link]').click(function(event){
      $(this).parents('li').hide();
      event.preventDefault();
    });
  });
};

export {testJs};
