$ ->
    menuToggle = $('#js-mobile-menu').unbind();
    $('#js-navigation-menu').removeClass "show";
    menuToggle.on "click", (event) ->
        event.preventDefault();
        $('#js-navigation-menu').slideToggle ->
            $('#js-navigation-menu').removeAttr 'style' if $('#js-navigation-menu').is "hidden"

    $(".report").hide();
    $('.hreport').on "click", (event) ->
      $(this).next().toggle()
