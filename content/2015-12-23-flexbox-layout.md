---
title : Flexbox 2-column layout
date : 2015-12-23
description : I've decided to use Flexbox on the blog because of it's ability to dynamically change the layout for different screen resolutions.
---

I've decided to use [Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes) because of it's ability to dynamically change the layout for different screen resolutions.

As an exercise, first I've implemented flex layout to display links to posts as cards. It didn't work 100% correctly and I've described the issue on [Stackoverflow](http://stackoverflow.com/questions/32572347/left-aligned-and-centered-grid-with-flexbox). The issue is not resolved until now.

Now I want to stick to more traditional kind of layout with two areas: `main` and `aside`. On desktop-size screens they are displayed as columns where `aside` has fixed width and `main` is flexible taking all the space left by `aside`. On mobile screens (< 600px) they change to rows, with `main` on top of `aside`. You can see the result on the [home page of my blog](http://lori2lori.rocks/).

The sample code is available on [Codepen](http://codepen.io/lori2lori/pen/eJzKrB)(resize the window to see the layout change):

<p data-height="268" data-theme-id="0" data-slug-hash="eJzKrB" data-default-tab="result" data-user="lori2lori" class='codepen'>See the Pen <a href='http://codepen.io/lori2lori/pen/eJzKrB/'>Flexbox fixed aside</a> by Dori (<a href='http://codepen.io/lori2lori'>@lori2lori</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

First, I've setup flex items to be displayed as multiple rows using `flex-flow: row-reverse wrap`. I also reversed the items because in html `main` appears after `aside`.

I've designed the mobile layout as a default (it's called mobile-first design), with `flex` assigned to 0 (`flex-grow` ) and to 100% (`flex-basis`). That will make both `main` and `aside` take 100% of the container width. Because I've set `flex-flow` to `wrap`, this will make the two elements display as rows.

```css
main, aside {
  flex: 0 100%;
}
```

Next, I've used media queries to create desktop layout (for screens with minimal width set to 600px). The `aside` area should have fixed width of 200px (this can be achieved by setting `flex-basis` to 200px).

I've also made `main`  to have flexible width by setting `flex-grow` to 1. This way it will take all the space left by `aside`.

```css
@media (min-width: 600px) {
  main {
    flex: 1 0 0px;
  }
  aside {
    flex: 0 0 200px;
  }
}
```

Overall, I think that flexbox is

(here)[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes]
