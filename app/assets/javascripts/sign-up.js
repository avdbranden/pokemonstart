$( document ).ready(function() {

  // Enable clicking submit when both terms and dataprivacy
  // checkboxes are checked

  $(function() {
    $('div.checkbox').click(function(event){

      if ( $("input:checked").length === 2 ) {
        $(".sign-up-btn").removeClass("disabled");
      } else {
        $(".sign-up-btn").addClass("disabled");
      }

    })

  })

});
