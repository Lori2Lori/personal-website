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
      @title "Learning programming from scratch"

    @body =>
      @header =>
        @img src: "/images/dorota.jpeg", id:'myphoto', alt:'My photo'
        @h1 'Learning programming from scratch'
        @div id: 'top-menu', =>
          @li =>
            @a href:'/000-about-this-page.html','ABOUT THIS PAGE'

      @tag 'main', =>
        @div class: 'posts', =>
          for post in posts.reverse()
            @a href: post.href, =>
              @h4 class: 'title', post.title
              @p class: 'description', post.description

              # TODO: Add dates to posts
              # if post.date? then =>
              #   date = moment post.date
              #   @time datetime: date.format(), date.calendar null,
              #     sameDay: '[Today]',
              #     nextDay: '[Tomorrow]',
              #     nextWeek: 'dddd',
              #     lastDay: '[Yesterday]',
              #     lastWeek: '[Last] dddd'
              #     sameElse : "MMMM Do YYYY"

              # TODO: Add description and date to posts 'bricks'

      @div id: 'copyright', =>
        @text "© Dorota Cieślińska 2015"

      @script src:"/scripts/analytics.js"
