#Bloodsucking tests

The most important lesson from yesterday: programming requires PATIENCE and SELF AWARENESS. I've learned one of the most important lesson in my (programmer) life. Don't get upset just because you don't know why something doesn't work. There are tons of things that could went wrong really and sometimes these are other peoples mistakes. Take a deep breath, go for a walk and start over with a fresh mind. 

I've learned this passing my first tests with Chai Mocha. Just couple weeks ago when I've heard "chai" I thought "tea" and "mocha" reminded me only of coffe. As you can imagine, programming is more than tea and coffee. I've discovered something called "tests-driven programming" - basically, first the developer writes some test case that describes a desired function of a program. Here I'm using [coffeescript](http://coffeescript.org/), a language that easy compiles into JavaScript:

```
it 'has a property species that equals cat', ->
  expect cat
    .to.have.property 'species'
    .which.is.a       'string'
    .and.is.eql       'cat'

```
Then he produces the code to pass that test, something like that:

```
module.exports =
  species : 'cat'
  
```

It may seem easy but I've spent hours to try to pass this kind of tests. Moreover, there are some issues like, should I use ":" or "=" in particular situation? Tests force very organized and precise thinking which is very difficult, yet effective way of programming, I believe.
