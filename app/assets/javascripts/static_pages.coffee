$ ->
    menuToggle = $('#js-mobile-menu').unbind();
    $('#js-navigation-menu').removeClass "show";
    menuToggle.on "click", (event) ->
        event.preventDefault();
        $('#js-navigation-menu').slideToggle ->
            $('#js-navigation-menu').removeAttr 'style' if $('#js-navigation-menu').is "hidden"
    $('.pagination a').on 'click', (event) ->
        event.preventDefault();
        $(".comments").html("<p>Loading next comments....</p>")
        doingAjax = $.ajax { url: this.href, dataType: "html" }
        doingAjax.done (response) ->
          comments = $(response).find(".comments")
          $(".comments").html(comments)
    
