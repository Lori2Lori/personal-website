View    = require "teacup-view"
marked  = require "marked"

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (articles) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Learning Front-End from scratch"
      #<!-- Bootstrap -->
      # # TODO: Use bootswatch theme https://bootswatch.com/
      # @link href: "bootstrap/dist/css/bootstrap.min.css", rel: "stylesheet"
      # @script src: "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"
      # @script src: "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"
    @body =>
      @header =>
        @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h1 'Learning Front-End from scratch'
        @ul =>
          @li =>
            @a href:'/','About me'
          @li =>
            @a href:'/','Contact'
          @li =>
            @a href:'/','Home'

      for article in articles
        @article class: 'content', =>
          markdown article
          #TODO use selector css first child to distinct content text from title
          @button 'read more'

    #<!-- jQuery (necessary for jQuery JavaScript plugins) -->
      @script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type: "text/javascript"
      @script src: "https://code.jquery.com/jquery-1.11.2.min.js"
      @coffeescript =>
        $ ->
          $('article.content > *').hide()
          $('article.content >:first-child').show()
          $('article.content > button').show()


          $("button").on "click", (event) ->
            $(event.target).siblings().show()



      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      #@script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      # @script src: "bootstrap/dist/js/bootstrap.min.js"
