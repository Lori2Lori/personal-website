View    = require "teacup-view"
marked  = require "marked"

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (posts) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Learning programming from scratch"
      #<!-- Bootstrap -->
      # # TODO: Use bootswatch theme https://bootswatch.com/
      # @link href: "bootstrap/dist/css/bootstrap.min.css", rel: "stylesheet"
      # @script src: "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"
      # @script src: "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"
    @body =>
      @header =>
        @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h1 'Learning programming from scratch'
        @div id: 'about_me', =>
          @p 'I am a former Lawyer who is learning to become a Web Developer'
        #TODO: in the future here we have menu
        #   @li =>
        #     @a href:'/','About me'
        #   @li =>
        #     @a href:'/','Home'

      for post in posts.reverse()
        @article class: 'content', =>
          @a href: post.href, post.title

    #<!-- jQuery (necessary for jQuery JavaScript plugins) -->
      @script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type: "text/javascript"
      @script src: "https://code.jquery.com/jquery-1.11.2.min.js"
      @coffeescript =>
        $ ->
          hide = =>
            $('article.content > *').hide()
            $('article.content >:first-child').show()
            $('article.content > button').show()

          do hide

          $("button").on "click", (event) ->
            console.log 'button clicked'
            # debugger
            do hide
            $(event.target)
              .siblings()
              .show 1000

            # TODO: scroll to when show is done
            scroll = =>
              # debugger
              console.log 'show complete'
              $('html, body').animate({
                scrollTop: $(this).parent().offset().top
              }, 500);

            setTimeout scroll, 1000

      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      #@script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      # @script src: "bootstrap/dist/js/bootstrap.min.js"
