View    = require "teacup-view"
marked  = require "marked"
moment  = require 'moment'

marked.setOptions breaks: true

markdown = new View (md) ->
  @raw marked md

module.exports = new View (post) ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      #<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
      @link rel: "stylesheet", href: "/css/index.css"
      @link rel: "stylesheet", href: "/css/prism.css"
      @link rel: "stylesheet", href: "https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
      @title "Learning programming from scratch"
    @body class: 'single-post', =>
      @header =>
        @a href: '/', =>
          @img src: "/images/dorota.jpeg", class: 'logo', alt:'My photo'
        @h1 class: 'title', post.title
        @h2 class: 'slogan', =>
          @a href:'/','Lori 2 Lori * rocks'

      @tag 'main', =>

        @article class: 'content', =>
          if post.date? then @h6 id: 'date', =>
            date = moment post.date
            @span 'Published: '
            @time datetime: date.format(), date.format('MMMM Do YYYY')

          markdown post.__content

        @div id: 'disqus_thread', =>
          @script src: '/scripts/disqus.js', type: 'text/javascript' # ?

      @footer =>
        @ul class: 'social', =>
          @li =>
            @a href:'https://github.com/Lori2Lori', =>
              @span class:"fa fa-github fa-4x"
          @li =>
            @a href:'https://twitter.com/Lori2Lori', =>
              @span class:"fa fa-twitter fa-4x"
          @li =>
            @a href:'http://stackoverflow.com/users/5236216/dorota-cieslinska', =>
              @span class:"fa fa-stack-overflow fa-4x"

        @div id: 'copyright', =>
          @text "© Dorota Cieślińska 2015"


      # jQuery (necessary for jQuery JavaScript plugins)
      @script src: "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js", type: "text/javascript"
      @script src: "https://code.jquery.com/jquery-1.11.2.min.js"
      @script src: "/scripts/analytics.js"
      @script src: '/scripts/disqus2.js', type: 'text/javascript'
      @script src: 'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js'
      @script src: "/scripts/prism.js"

      @coffeescript =>
        # Replace absolute date in the time element's content with relative one
        element = $("#date time")
        date = moment element.attr("datetime")
        element.text date.calendar null,
          sameDay: '[Today]',
          nextDay: '[Tomorrow]',
          nextWeek: 'dddd',
          lastDay: '[Yesterday]',
          lastWeek: '[Last] dddd'
          sameElse : "MMMM Do YYYY"
