---
title : Updating content on server
date : 2015-04-23
description: Description of my server and of tools I use to manage it
---

Finally, I've deployed my first website on my own [VPS](http://en.wikipedia.org/wiki/Virtual_private_server)! I use [Digital Ocean](https://www.digitalocean.com/?refcode=629046ed2b31) to host it and following tools to deploy and update:

* git & GitHub
* ssh
* iojs
* Gulp
* Docker
* Nginx

Next time I'll describe how to place it on server for the first time. Now I want to focus on an update process.

First, in terminal, I need to log in to my  server as root, using [ssh (secure shell)](http://en.wikipedia.org/wiki/Secure_Shell)

```bash
ssh root@lori2lori.rocks
```

Then I need to go to my repository (directory where my files are). In my case it's 'personal-website'

```bash
cd ~/personal-website
```

Then pull latest changes from GitHub
```bash
git pull
```

I decided not to install iojs on server and use containers instead

```bash
docker run -itw "/personal-website" --rm -v ~/personal-website:/personal-website iojs npm run build
```

The option `-w` means that default working directory for running programs within a container is /personal website, not the root directory

`npm run build` is a command  that will be executed in the container. It starts a 'build' task defined in a gulpfile.

Changes are now visible on the website!
