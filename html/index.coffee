View = require "teacup-view"

module.exports = new View ->
  @doctype 5
  @html =>
    @head =>
      @title "Skubi, Programming and Design"
    @body =>
      @div => # Inside view use fat arrow to keep reference to teacup object
        @h1 "Hello Lori"
        @p  "It's nice to see you Lori!"
