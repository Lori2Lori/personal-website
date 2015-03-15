View = require "teacup-view"

module.exports = new View ->
  @doctype 5
  @html =>
    @head =>
      @link rel: "stylesheet", href: "bootstrap/dist/css/bootstrap.min.css"
      @title "Cats, Programming and Design"
    @body =>
      @div => # Inside view use fat arrow to keep reference to teacup object
        @h1 "Hello Tadeusz"
        @p  "It's nice to see you Lori! I love you"
