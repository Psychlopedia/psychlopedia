(function($) {
  $(document).ready(function() {
    $(".notice").on("click", function(ev) {
      $(ev.target).hide();
    });
  });
})(jQuery);
