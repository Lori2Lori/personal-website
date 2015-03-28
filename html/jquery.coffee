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
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
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
      @p "This is a jQuery playground"
      @p "Something"


      #<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      @script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
      @script src: "bootstrap/dist/js/bootstrap.min.js"
      @script """
        paragraphs = $('p')
        paragraphs.addClass("well")
      """
