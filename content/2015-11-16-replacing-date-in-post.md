---
title : Replace absolute date in the time element's content with relative one
date : 2015-11-16
description :
---

As I've mentioned it on the previous post [Creating object from a text](http://lori2lori.rocks/2015-08-29-creating-object-from-a-file.html), I'm using [moment](http://momentjs.com/docs/) library, to insert dates on my website.

It provides easy, flexible way to [display](http://momentjs.com/docs/#/displaying/) dates, for example:

|Date               | Output               |
| ------------------|:--------------------|
|Last week	        | Last Monday at 2:30 AM|
|The day before	    | Yesterday at 2:30 AM |
|The same day       |	Today at 2:30 AM     |
|The next day       |	Tomorrow at 2:30 AM  |
|The next week	    | Sunday at 2:30 AM    |
|**Absolute date**  |        |
| Month (MMMM)  | January ...  December |
| Day   (Do)     |  1st 2nd ... 30th 31st|
| Year  (YYYY)   |   1970 ... 2018 2030  |

At first, I've inserted code into the `<body>` tag:

```coffeescript
if post.date? then @h6 id: 'date', =>
  date = moment post.date
  @span 'Published: '
  @time datetime: date.format(), date.calendar null,
    sameDay: '[Today]',
    nextDay: '[Tomorrow]',
    nextWeek: 'dddd',
    lastDay: '[Yesterday]',
    lastWeek: '[Last] dddd'
    sameElse : "MMMM Do YYYY"
```
It caused a post date appear always as "Yesterday", regardless of the current date. Well, it wasn't exactly what I expected.

 The problem arised because function `date.calendar` was called only once, when the static page was created on the server.
 I had to figure out, how to render date on the web browser site, instead of the server site.

The code looked like that:

```html
<h6 id="date"><span>Published: </span><time datetime="2015-11-14T00:00:00+00:00">Yesterday</time></h6>
```
I used jQuery script to find the date element in my html code and voila, the problem was solved.

```coffeescript
@coffeescript =>
  # @coffeescript tag is a coffeescript function that converts coffee into js directly. Thanks to that, there is no need for creating additional .js file for scripts.

  element = $("#date time")
  date = moment element.attr("datetime")
  element.text date.calendar null,
    sameDay: '[Today]',
    nextDay: '[Tomorrow]',
    nextWeek: 'dddd',
    lastDay: '[Yesterday]',
    lastWeek: '[Last] dddd'
    sameElse : "MMMM Do YYYY"
```

There was one thing left to do: make sure that the date will be visible even if javascript is disabled in the browser. That's why I left an absolute `date.format('Do MMMM YYYY')` in the `<body>`.

```coffeescript
if post.date? then @h6 id: 'date', =>
  date = moment post.date
  @span 'Published: '
  @time datetime: date.format(), date.format('MMMM Do YYYY')
```

The result is most visible in newest posts.
