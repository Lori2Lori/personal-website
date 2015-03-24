View = require "teacup-view"

module.exports = new View ->
  @doctype 5
  @html =>
    @head =>
      @link rel: "stylesheet", href: "bootstrap/dist/css/bootstrap.min.css"
      @link rel: "stylesheet-css", href: "index.css/bootstrap.min.css"
      @title "Programming, Design and... Cats"
    @body =>
      @div =>
        

      @div => # Inside view use fat arrow to keep reference to teacup object
        @h1 "Hello Tadeusz"
        @p  "Let's start now!"
