---
title : Node.js version matters
date : 2015-11-24
description : Sometimes code just doesn't work. Instead of getting frustrated, better check node version
---

Today I wanted to learn something new about `Object` constructor, I've chosen `Object.assign()` method.

First I've read about it on [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) and then I've tried it using [REPL](https://nodejs.org/api/repl.html) in the terminal.

I've followed the docs but I got my favorite **<font color="red">`TypeError: undefined is not a function`</font>**. I've spent a lot of time thinking that I've done something wrong.

It turns out that JavaScript is a fast moving language nowadays. I had [node.js](https://nodejs.org/en/about/) version 0.12, which I've installed about six months ago when I [switched to MAC](http://lori2lori.rocks/2015-03-18-installing-tools-on-mac.html). That version didn't have implemented a lot of new [ECMAScript 6]() features - `Object.assign()` among them.

Fortunately, it was easy enough to update node to the latest version using [nvm](https://github.com/creationix/nvm) (Node Version Manager). There are other ways to update node but with nvm it was like a breeze:

```bash
Try `nvm ls-remote` to browse available versions.
Dorotas-MacBook-Air:~ dorota$ nvm install v5.1.0
######################################## 100.0%
Checksums empty
Now using node v5.1.0 (npm v3.3.12)
```

If you want to install the latest node version, instead of version pointer (for example v5.1.0) it is sufficient to just use `node`:

```bash
nvm install node
```
