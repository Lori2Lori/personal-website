View    = require "teacup-view"
marked  = require "marked"

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (article) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Learning Front-End from scratch"
    @body =>
      # Google Tag Manager
      @noscript =>
        @iframe
          src:"//www.googletagmanager.com/ns.html?id=GTM-TL38JX"
          height:"0"
          width:"0"
          style:"display:none;visibility:hidden"
      @script src:"/scripts/google-tag-manager.js"
      # End Google Tag Manager
      @header =>
        @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h1 'Learning Front-End from scratch'
        @div id: 'about_me', =>
          @p 'I am a Lawyer who is learning to become a Front-End Developer'
        #TODO: in the future here we have menu
        #   @li =>
        #     @a href:'/','About me'
        #   @li =>
        #     @a href:'/','Home'

      @article class: 'content', =>
        markdown article

      # jQuery (necessary for jQuery JavaScript plugins)
      @script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type: "text/javascript"
      @script src: "https://code.jquery.com/jquery-1.11.2.min.js"
