$( document ).ready(function() {

  // Click on button to remove disable checkbow and disabled hover class
  $('#btn-authorize').click(function(e) {
    e.preventDefault();
    console.log(this);
    $(".disabled").prop("disabled", false).removeClass("disabled");
  });

  // Fire tooltip
  $(function () {
    $('.required').tooltip()
  })
});
