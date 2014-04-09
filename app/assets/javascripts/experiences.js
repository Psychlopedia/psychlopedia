(function($) {
  $(document).ready(function() {
    $(".notice").on("click", function(ev) {
      $(ev.target).hide();
    });

    $(".enrichment").on("click", function(ev) {
      ev.stopPropagation();
      ev.preventDefault();

      $("div.cocktail").toggle();
    });

    var substances = [
      "Cannabis",
      "THC",
      "Marihuana",
      "Faso",
      "DXM",
      "Dextrometorfano",
      "Ketamina",
      "PCP",
      "Fenciclidina",
      "Óxido Nitroso",
      "LSD",
      "MDMA",
      "Extasis",
      "25i-NBOMe",
      "25b-NBOMe",
      "25c-NBOMe",
      "4-AcO-DMT",
      "Salvia Divinorum",
      "Psilocibina",
      "Cucumelo",
      "Amanita Muscaria",
      "Muscimol",
      "Muscarina"
    ];

    $("input[id$='substance']").autocomplete({
      source: substances
    });
  });
})(jQuery);
