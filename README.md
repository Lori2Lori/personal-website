Personal website about programming and design.
==============================================

How to start hacking on this project
------------------------------------

This instruction assumes that you use some Linux system. Setting it up on Mac OS should be similar though.

  1.  Clone this repository

  2.  Install node.js (or io.js)

      The simplest way is to use [nvm][]

  3.  Inside repository directory install all dependencies listed in [package.json](./package.json) using `npm install`.

      This will install [gulp][] in `node_modules/.bin/gulp` among other things.

      `npm` is installed along with `node.js` or `io.js`, so you should already have it.

  4.  Run `node_modules/.bin/gulp serve`

      This will:

        * Compile your code into `build/` directory
        * Start watching for changes and rebuild when necessary
        * Start a local web server on port 8000
        * Open your web browser and point it to this server

  5.  You are ready! Now just make changes to the code and in few seconds they should be reflected in the browser.

[nvm]:  https://github.com/creationix/nvm
[gulp]: http://gulpjs.com/
