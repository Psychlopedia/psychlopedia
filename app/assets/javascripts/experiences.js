(function($) {
  $(document).ready(function() {
    $("a.toggle_comments").click(function(ev) {
      ev.preventDefault();
      $("#comments").toggle();
    });
  });
})(jQuery);
