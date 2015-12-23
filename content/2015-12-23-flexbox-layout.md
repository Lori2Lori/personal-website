---
title : Flexbox two column layout
date : 2015-12-23
description : I've decided to use Flexbox layout on the blog because it's ability to dynamically change the layout for different screen resolutions.
---

Finally I've made new layout for the blog. I've decided to use [Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes) mode because it's ability to dynamically change the layout for different screen resolutions.

As an exercise, first I've implemented flex layout to display posts within cards. It didn't work 100% correctly and I've described the issue on [Stackoverflow](http://stackoverflow.com/questions/32572347/left-aligned-and-centered-grid-with-flexbox). The issue is not resolved until now.

Now I want to stick to more traditional kind of layout with two areas: `main` and `aside`, where `main` area has flexible width and `aside` has fixed width. On desktop they are displayed as columns but on mobile screens they change to rows. You can see the result on the [home page](http://lori2lori.rocks/).

The sample code is available on [Codepen](http://codepen.io/lori2lori/pen/eJzKrB) (resize the window to see the layout change):
<p data-height="268" data-theme-id="0" data-slug-hash="eJzKrB" data-default-tab="result" data-user="lori2lori" class='codepen'>See the Pen <a href='http://codepen.io/lori2lori/pen/eJzKrB/'>Flexbox fixed aside</a> by Dori (<a href='http://codepen.io/lori2lori'>@lori2lori</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

First, I've authorized flex items to be displayed on multiple rows using `flex-flow: row-reverse wrap`. The 'reverse' method is used to put `aside` under `main` when items are wrapped.

Then I've created view for mobile screens as a default, with `flex` assigned to 0 (`flex-grow` ) and to 100% (`flex-basis`). That will make both `main` and `aside` to take 100% of the current viewport width.

```stylus
main, aside
  flex: 0 100%
```

Next, I've used media queries to create desktop view with minimal width set to 600px. `Aside` area should have fixed width (this can be achieved by setting `flex-basis` to some value, in this case 200px).

Because I wanted `main` area to have flexible width I assigned `flex-grow` to 1, this way it takes all space left.

```stylus
@media (min-width: 600px)
  container main
    flex: 1 0 0px
  container aside
    flex: 0 0 200px
```

And the old layout looked like that:

<img class="img-responsive" src="/images/layout-2015-11-thumbnails.png" alt="Previous layout with cards" >
