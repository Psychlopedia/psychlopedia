(function($) {
  $(document).ready(function() {
    $("a.toggle_comments").click(function(ev) {
      ev.preventDefault();
      $("#comments").toggle();
    });

    $(".notice").on("click", function(ev) {
      $(ev.target).hide();
    });
  });
})(jQuery);
