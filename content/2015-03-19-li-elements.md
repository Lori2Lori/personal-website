#Contemptious html lists and debugging

Today I've discovered that `<li>` elements in list have to be in `<ul>`, `<ol>` or `<menu>` container. It can't be inside `<div>` element. Why? It remains a mystery to me (for now).

How did I discover it? There is a great tool to debug html (or css or javascript or other language). You can just put code into certain website (I used [W3C](http://validator.w3.org/) and voila! Errors and warnings are on your plate. It's so wonderful tool that I was shocked hearing that many people doesn't use it.

But there is one huge disadvantage: you have to check it each time manually. Or maybe not?

There is a great programm that can check your code and show you errors in terminal, as soon as you save your file. It's called [gulp](http://gulpjs.com/). It makes programmers life way easier, by automatizing repeating actions.

Gulp runs on javascript and can be customized to meet your needs.
