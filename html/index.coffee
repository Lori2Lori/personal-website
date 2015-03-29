View    = require "teacup-view"
marked  = require "marked"
fs      = require 'fs'

# content = fs.readFileSync './content/15.03.17.Starting programming from scratch.md', 'utf-8'
markdown = new View (md) ->
  @raw marked md

module.exports = new View ->

  @doctype 5
  @html lang: "en", =>
    @head =>
      @meta charset: "utf-8"
      @meta "http-equiv": "X-UA-Compatible", content:"IE=edge"
      @meta name: "viewport", content: "width=device-width, initial-scale=1"
      @link rel:"stylesheet", href:"/css/index.css"
      @title "My portfolio"
    @body =>
      @div id:"top_center", =>
        @h1 class:"niebieski", "Hello!"
        @h2 class:"szary", "I am a professional cinematographer with years of experience filming everything from feature films to music videos to superbowl commercials."

      @div id:"white_center", =>

        @div class:"left_column", =>
          @h3 class:"niebieski", "Advertising"
          @h6 class:"szary", "Lorem ipsum dolor sit amet, consec tetue."
          @p "Lorem ipsum dolor sit amet, consec tetuer adipi scing. Praesent vestibu. lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus."
          @a href:"", class:"more", "more"

        @div class:"center_column", =>
          @h3 class:"niebieski", "Web video"
          @h6 class:"szary", "consec tetuer adipi scing Praesent."
          @p "Scing. Praesent vestibu. lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus. porta. Fusce suscipit varius mium sociis totdnat"
          @a href:"", class:"more", "more"

        @div class:"right_column", =>
          @h3 class:"niebieski", "Corporate"
          @h6 class:"szary", "lum molestie lacuiirhs. Aenean non um."
          @p "Aenean non ummy hendreriauris. Phasellllus. porta. Fusce suscipit varius mium sociis totdnat. ibuset magis dis parturient montes, nascetur."
          @a href:"", class:"more", "more"

        @div id:"clear"

      @div id:"bottom_center", =>

        @div id:"lewa_kolumna", =>
          @h3 class:"dark", "Welcome to my site!"
          @img src:"/home-1.jpg" , alt:"my picture"
          @h6 class:"szary", "Lorem ipsum dolor sit amet, consec teer adipiscing. Prsent vestibulum molestie lacuiirhs. Aeneon my."
          @p "Lorem ipsum dolor sit amet, consec tetuer adipiscing. Praesent vestibu lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus. porta. Fusce suscipit varius mium sociis totdnatibus et magis dis parturient montes, nascetur ridiculus mus. Nulla dui."

        @div id:"srodkowa_kolumna", =>
          @h3 class:"dark", "Events calendar"
          @div class:"data_1"
          @span class:"data", "24.09.2012"
          @h6 class:"szary", "Lorem ipsum dolor sit amet, consec teer adipiscing. Prsent vestibulum."
          @p "Lorem ipsum dolor sit amet, consec tetuer adipi scing. Praesent vestibu. lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus."

          @div class:"data_2"
          @span class:"data", "27.11.2014"
          @h6 class:"szary", "Lorem ipsum dolor sit amet, consec teer adipiscing. Prsent vestibulum."
          @p "Lorem ipsum dolor sit amet, consec tetuer adipi scing. Praesent vestibu. lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus."

        @div id:"prawa_kolumna", =>
          @h3 class:"dark", "Featured works"
          @h6 class:"szary", "Lorem ipsum dolor sit amet, consec teer adipiscing. Prsent vestibulum molestie lacuiirhs. Aeneon my."
          @p "Lorem ipsum dolor sit amet, consec tetuer adipi scing. Praesent vestibu. lum molestie lacuiirhs. Aenean non ummy hendreriauris. Phasellllus."
# TODO: 'clear must be named differently'
        @div id:"clear2"
