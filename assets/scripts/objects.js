

cat_element = $("<dl></dl>")
  .addClass("dl-horizontal")
  // .css({color: "red", background: "yellow"})
  .append($("<dt>name</dt>"))
  .append($("<dd>Katiusza</dd>"))
  .appendTo($("#cats"))

// TODO: chain below two lines as well :)
// HINT: use appendTo


// div = $("#cats")
// div.append(cat_element)



var cat = {
  name  : "Skubi",
  color : "white",
  weight: "muscular",
  mood  : "sleepy"
}

// TODO: add another definition list, this time taking values from cat object

// TODO: wrap it into a function that takes cat object and appends definition list to the DOM tree


// TODO: make a form with cat's data
// TODO: when user submits the form, make a cat object from it
// TODO: then append a definition list to the DOM tree

// TODO: make an array of cats (Skubi, Katiusza, George) and make one definition list for each
// HINT: use cats.forEach(function(cat) { ... })
// SEE: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach#Examples

// @dl class:"dl-horizontal", =>
//   @dt "name"
//   @dd "Skubi"
//   @dt "color"
//   @dd "white"
//   @dd "brown"
