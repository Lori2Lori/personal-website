View = require "teacup-view"

module.exports = new View ->
  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @title "Programming, Design and... Cats"
      #<!-- Bootstrap -->
      # TODO: Use bootswatch theme https://bootswatch.com/
      @link href: "bootstrap/dist/css/bootstrap.min.css", rel: "stylesheet"
      @link rel: "stylesheet", href: "index.css"
      @script src: "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"
      @script src: "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"
    @body =>
      @div class: "container", =>
        @div class: "social-media-icons", =>
          @ul =>
            @li class: "media_icon", id: "social-icons", =>
              @a href: "http://twitter.com/#!/lori2lori", =>
                @img
                  src: "/images/twitter.png"
                  border:"0"
        @div class: "site-name", =>
          @h1 "Hello Tadeusz!"

      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      @script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      @script src: "bootstrap/dist/js/bootstrap.min.js"
