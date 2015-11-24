View    = require "teacup-view"
marked  = require "marked"
moment  = require 'moment'

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
      @link rel: "stylesheet", href: "/css/prism.css"
      @link rel: "stylesheet", href: "https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
      @title "Learning programming from scratch"

    @body =>
      @header =>
        @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h2 'Learning programming from scratch'
        @div id: 'top-menu', =>
          @li =>
            @a href: '/000-about-this-page.html','ABOUT THIS PAGE'

      @tag 'main', =>
        @div class: 'posts', =>
          for post in posts.reverse()
            @a href: post.href, =>
              @h5 class: 'title', post.title
              @p class: 'description', post.description

              # TODO: Think about adding dates to posts (maybe)

      @div id: 'footer', =>
        @ul =>
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

      @script src:"/scripts/analytics.js"
      @script src: "/scripts/prism.js"
