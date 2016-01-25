View    = require "teacup-view"
marked  = require "marked"

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
      @link href:'http://fonts.googleapis.com/css?family=Roboto:400,700,900', rel:'stylesheet', type:'text/css'
      @title "Programming, Design and... Cats"
      #<!-- Bootstrap -->
      # TODO: Use bootswatch theme https://bootswatch.com/
      @link href: "bootstrap/dist/css/bootstrap.min.css", rel: "stylesheet"
      @link rel: "stylesheet", href: "/css/index.css"
      @script src: "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"
      @script src: "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"
    @body =>
      @div class: "container-fluid", =>
        @div class: "row header", =>
          @div class: "row", =>
            @div class: "col-md-4", =>
              @img
                class: "my-cat-logo"
                src: "images/my-cat-logo.jpg"
                alt: "My logo"
            @ul class: "media-icons col-md-8", id: "social-media-icons", style:"text-align: center;", =>
              @li class: "media_icon", id: "social-icons", =>
                @a href: "http://twitter.com/#!/lori2lori", =>
                  @img
                    src: "/images/twitter.png"
                    alt: "Twitter logo with link"
              @li class: "media_icon", id: "github-icon", =>
                @a href: "https://github.com/Lori2Lori", =>
                  @img
                    class: "github-round"
                    src: "/images/github-logo-small.png"
                    alt: "GitHub logo with link"
            # TODO: @div class: "search-engine col-md-4", "search: search engine"
            # TODO: @div class: "subscribe-button col-md-4", "subscribe: subscribe button"

        @div class: "row site", =>
          @div class: "about-me col-md-4", =>
            @div "About me (with picture)"
            # TODO:
            # @li "Some list here"
            # @li "Some nice quotes from database chosen randomely"
            # @li "RSS feed or other news"
          @div class: "content col-md-8", =>
            @h1 "Website about programming, design and... cats and stars and dogs"

            for article in articles
              @div class: 'content', markdown article
        @footer class: "footer", =>
          @ul class: "footer-sidebar", =>
            @li "contact"
            @li "credits"
            # TODO: @li "subscribe"


      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      @script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      @script src: "bootstrap/dist/js/bootstrap.min.js"
