/**
 * Soon.
 * */
(function($) {
  $(document).ready(function() {
    $("a.toggle").click(function(ev) {
      ev.preventDefault();
      $("body").toggleClass("colorwave");
    });
  });
})(jQuery);
