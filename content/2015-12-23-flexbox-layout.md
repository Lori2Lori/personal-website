---
title : Flexbox 2-column layout
date : 2015-12-23
description : I've decided to use Flexbox mode on the blog because it's ability to dynamically change the layout for different screen resolutions.
---

I've decided to use [Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes) mode because it's ability to dynamically change the layout for different screen resolutions.

As an exercise, first I've implemented flex layout to display posts within cards. It didn't work 100% correctly and I've described the issue on [Stackoverflow](http://stackoverflow.com/questions/32572347/left-aligned-and-centered-grid-with-flexbox). The issue is not resolved until now.

Now I want to stick to more traditional kind of layout with two areas: `main` and `aside`, where `main` area has flexible width and `aside` has fixed width. On desktop they are displayed as columns but on mobile screens they change to rows. You can see the result on the [home page](http://lori2lori.rocks/).

The sample code is available on [Codepen](http://codepen.io/lori2lori/pen/eJzKrB)(resize the window to see the layout change):
<p data-height="268" data-theme-id="0" data-slug-hash="eJzKrB" data-default-tab="result" data-user="lori2lori" class='codepen'>See the Pen <a href='http://codepen.io/lori2lori/pen/eJzKrB/'>Flexbox fixed aside</a> by Dori (<a href='http://codepen.io/lori2lori'>@lori2lori</a>) on <a href='http://codepen.io'>CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

First, I've authorized flex items to be displayed on multiple rows using `flex-flow: row-reverse wrap`. I also reversed the items because in html `article` appears after `aside`.

Then I've created view for mobile screens as a default, with `flex` assigned to 0 (`flex-grow` ) and to 100% (`flex-basis`). That will make both `article` and `aside` to take 100% of the current viewport width.

```css
article, aside
  flex: 0 100%
```

Next, I've used media queries to create desktop view with minimal width set to 600px. `Aside` area should have fixed width equal 200px (this can be achieved by setting `flex-basis` to 200px).

I wanted `article` area to have flexible width (`flex-grow` assigned to 1), this way it takes all space left.

```css
@media (min-width: 600px)
  main article
    flex: 1 0 0px
  main aside
    flex: 0 0 200px
```

Overall, I think that flexbox is

(here)[https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes]
