---
title : Advantages of writing own code while using tutorials
date : 2015-11-14
description : While it's quite easy to follow tutorials, I prefer to change code to learn other things as well.
---

I've made another discovery while learning [React.js](https://facebook.github.io/react/) from [Build Web Apps with React JS and Flux](https://www.udemy.com/learn-and-understand-reactjs) course on Udemy.com. My code is on GitHub [here](https://github.com/Lori2Lori/TODO-list-React-with-Fire-Base).

Learning from internet courses is tempting and may seem easy when following instructor step by step. I've discovered an exciting way how to learn the most from each course:

**First**, I write in CoffeScript instead of plain JavaScript. It's more simple and in my opinion more efficient, braces and commas are barely needed.

**Second**, I create my own build system. I take my old build system and try to make it better each time and of course adjust to actual needs.

**Third**, I create components as soon as I get an idea what do I want to make, before instructor show how to od it. I also play with different options that can be used in the future.

### Advantages of learning programming this way:

- Enhancing creativity and self-esteem
- Learning CoffeScript and JavaScript simultaneously
- Implementing new features to own build system
- And most importantly - it forces me to find new solutions for the same problems, because as application improves, there are more differences between tutorial and my code

Here is some simple example:

In tutorial code looks like that:

```
render: function() {
  return <ul>
    {this.renderList()}
  </ul>
},
renderList: function() {
  if(this.props.items && Object.keys(this.props.items).length === 0)
    return <h4>
      Add a todo to get started.
    </h4>
  }
}
```

And my code:

```
render: ->
<ul>
  { if @props.items is null
      <h4>
        Add a todo to get started.
      </h4>
  }
</ul>
```
