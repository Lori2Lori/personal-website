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
        @h1 class: 'title', =>
          @raw 'Lori 2 Lori * rocks'
        @h2 class: 'slogan', 'Learning programming from scratch'

      @tag 'main', =>
        @div class: 'posts', =>
          for post in posts.reverse()
            @a href: post.href, =>
              @h5 class: 'title', post.title
              @p class: 'description', post.description

        @div class: 'about', =>
          @img src: "/images/dorota.jpeg", class: 'logo', alt:'My photo'
          markdown """
            On this website I'd like to share my experience with learning programming, especially web development and design.

            As I've started to build this website I was a lawyer with several years of professional experience and dream to become a web developer. I've started to learn graphic design and programming and soon got a job including software engineering in a translation company.

            I have a goal to make this website totally from scratch, so I'm not using here any pre-build CMS. I will be experimenting with better and worse features.

            I'm open to suggestions about improving this website, feel free to leave a comment or contact me at [<i class="fa fa-twitter"> Twitter</i>](https://twitter.com/Lori2Lori) or make pull request on [<i class="fa fa-github"> GitHub</i>](https://github.com/Lori2Lori).

          """
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

              # TODO: Think about adding dates to posts (maybe)

      @footer =>

        @div id: 'copyright', =>
          @text "© Dorota Cieślińska 2015"

      @script src:"/scripts/analytics.js"
      @script src: "/scripts/prism.js"
