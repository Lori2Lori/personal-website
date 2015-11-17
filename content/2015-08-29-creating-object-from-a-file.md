---
title : Creating object from a text
date : 2015-08-29
description : How to manage different kind of data in a single markdown document, using Yaml Front Matter
---

Today I've discovered an amazing package [Yaml Front Matter](https://www.npmjs.com/package/yaml-front-matter), which can be used to manage different data in text.

I use this [npm](https://www.npmjs.com/private-modules) package to parse [yaml](https://en.wikipedia.org/wiki/YAML) at the front of a file. It places the parsed content plus the rest of the file's content into an object.

As I write, this post looks like this (I write in [markdown](http://daringfireball.net/projects/markdown/)- it's great but this package can be used on other file formats as well):

```
---
title : Creating object from a text
date : 2015-08-29
---
Today I've discovered amazing package - [Yaml Front Matter]
 (https://www.npmjs.com/package/yaml-front-matter).
```

Thanks to this package it is easy to create an object for the later use:

```
{
  title: 'Creating object from a text',
  date: '2015-08-29',
  __content: 'Today I've discovered amazing package - [Yaml Front Matter]
   (https://www.npmjs.com/package/yaml-front-matter).'
}
```

It is also extremely easy to insert more details to the document:

```
contact: {
  email: 'email@domain.com',
  address: 'some location'
},
pets: [
  'cat',
  'dog',
  'bat'
],
match: /pattern/gim,
run: [Function],
```

How is it used on this page exactly? As you can see below, I use "title", "date" and "__content" to create my posts with a little help of coffeescript.

```
@article class: 'content', =>
  @h1 post.title
  if post.date? then @h6 =>
    date = moment post.date
    @span 'Published: '
    @time datetime: date.format(), date.calendar null,
      sameDay: '[Today]',
      nextDay: '[Tomorrow]',
      nextWeek: 'dddd',
      lastDay: '[Yesterday]',
      lastWeek: '[Last] dddd'
      sameElse : "MMMM Do YYYY"

  markdown post.__content
```

I hope you liked this post and you'll try make a use of front matter in some of your projects.

Ps. I manage date using [moment](http://momentjs.com/docs/) and I write about it on the post [Replace absolute date with relative one](http://lori2lori.rocks/2015-11-16-replacing-date-in-post.html).
