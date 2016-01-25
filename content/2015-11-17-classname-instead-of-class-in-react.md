---
title : ClassName instead of class in react.js
date : 2015-11-17
description : How I discovered that console in the browser is my best friend and why "class" doesn't work in react.js
---

As I've mentioned before in post [Advantages of writing own code while using tutorials](http://lori2lori.rocks/2015-09-30-advantage-of-writing-own-code.html), I try to implement tutorials into my projects.

That's why, while doing [responsive web design course](https://www.coursera.org/learn/responsive-web-design/home/welcome) on Coursera, I decided to apply new features into my react.js application - the code is available on my [<i class="fa fa-github">GitHub</i>](https://github.com/Lori2Lori/TODO-list-React-with-Fire-Base).
I wanted to implement some new [Bootstrap]() components to my react project but with no luck. Result just didn't appear on page. I've checked terminal but everything was ok there. I've checked Bootstrap documentation carefully and I've watched tutorial for the second time. I just couldn't understand why new styles don't appear on the preview.

Finally, I've opened the console in the browser and there it was - warning message <font color="red">`"Unknown DOM property class. Did you mean className?"`</font>.

How simple is that? That's how I've got to understand why in react.js `class` is called `className`. You can read more about it on this [react.js GitHub](https://github.com/facebook/react/pull/328) thread.

The result for now:

<img class="img-responsive" src="/images/todo-app.png" alt="to-do list" >
