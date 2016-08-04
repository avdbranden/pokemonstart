$( document ).ready(function() {

  // Click on button to remove disable checkbow and disabled hover class
  $('#btn-authorize').click(function(e) {
    e.preventDefault();
    console.log(this);
    $(".disabled").prop("disabled", false).removeClass("disabled");
  });

  // Fire tooltip
  $(function() {
    $('.required').tooltip()
  })

  // Show/hide warning message when data required checked/unchecked
  $(function() {
    $('div.consent-checkbox').click(function(event){
      var clear = $('div.required input.boolean:checked').length;
      console.log(clear);
      if ( clear != 3 ) {
        console.log($('div.required input.boolean'));
        $('div#about-to-leave').removeClass('hidden');
      } else {
        console.log("there");
        $('div#about-to-leave').addClass('hidden');
      }
    });
  });

});
