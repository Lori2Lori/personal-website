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
      @link rel: "stylesheet", href: "/css/index.css"
      @title "Łukasz Bańkowski radca prawny"

    @body =>
      @tag 'container', =>

        @div class: 'header', =>
          @div class: 'logo', =>
            @h3 'Łukasz Bańkowski'
            @h3 'Law advisor'
          @div class: 'menu', =>
            @div 'CONTACT'
            @div 'CERTIFICATION'
            @div 'REFERENCES'

        @div class: 'main-picture', =>
          @h1 'PROFESSIONAL LEGAL HELP AT AFFORDABLE RATES'
          @h2 'GO TO CONTACT'

        @div class: 'main', =>
          @div class: 'areas-of-expertise', =>
            @div 'CONTRACTS'
            @div 'PERSONAL'
            @div 'ADMINISTRATIVE'
          @div class: 'description', =>
            @h2 'MY STORY'
            @p 'I am certified lawyer with several years of experience.'

        @div class: 'references', =>
          @h2 'REFERENCES'
          @p """Łukasz is one of the most energetic lawyers I've been working with."""
          @h5 'JAN KOWALSKI - RADCA PRAWNY'

        @div class: 'certification', =>
          @h2 'PROFESSIONAL CERTIFICATION'
          @p '(wpis na listę radców prawnych, inne)'

        @footer =>
          @h2 'CONTACT'
          @p 'I work in Warsaw and Łódź'

          @div class: 'logo', =>
            @h3 'Łukasz Bańkowski'
            @h3 'Law advisor'

          @div class: 'contact', =>
            @p 'Phone: 500-100-200'
            @p 'Email: info@lukaszbankowski.pl'

          @div class: 'copyright', =>
            @text "© Dorota Cieślińska 2015 url"
