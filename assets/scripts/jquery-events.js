add_well = function() {
  paragraphs = $('p')
  paragraphs.addClass("well")
}

$("button").on("click", add_well)

// on() is a function that takes 2 parameters:
// 1. first is an event name
// 2. second is a function
