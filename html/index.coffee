View    = require "teacup-view"
marked  = require "marked"
fs      = require 'fs'

content = fs.readFileSync './content/15.03.17.Starting programming from scratch.md', 'utf-8'
markdown = new View (md) ->
  @raw marked md



module.exports = new View ->
  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible"
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
            @div class: "my-cat-logo col-md-4", =>  @img src: "images/my-cat-logo.jpg"
            @div class: " col-md 4", id: "social-media-icons", =>
              @li class: "media_icon", id: "social-icons", =>
                @a href: "http://twitter.com/#!/lori2lori", =>
                  @img
                    src: "/images/twitter.png"
                    border:"0"
              @li class: "media_icon", id: "social-icons", =>
                @a href: "https://github.com/Lori2Lori", =>
                  @img
                    src: "/images/github-logo-small.png"
                    border:"0"
            @div class: "search-engine col-md-4", => @li "search engine"
            @div class: "subscribe-button col-md-4", => @li "subscribe button"
        @div class: "site", =>
          @div class: "about-me", class: "col-md-4", =>
            @li "About me (with picture)"
            @li "Some list here"
            @li "Some nice quotes from database chosen randomely"
            @li "RSS feed or other news"
          @div class: "content",class: "col-md-8", =>
            @h1 "Website about programming, design and... cats"

            @div class: 'content', markdown content
        @footer class: "footer", =>
          @div class: "footer-sidebar", =>
            @li "contact"
            @li "subscribe"
            @li "credits"


      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      @script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      @script src: "bootstrap/dist/js/bootstrap.min.js"
