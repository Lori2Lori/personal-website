Personal website about programming and design.
==============================================

How to start hacking on this project
------------------------------------

This instruction assumes that you use some Linux system. Setting it up on Mac OS should be similar though.

  1.  Clone this repository (or pull if you already have it)

  2.  Install node.js (or io.js)

      First if you don't have curl installed, run:

      ```
      sudo apt-get install curl
      ```

      The simplest way is to use [nvm][] run this command:

      ```
      curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
      ```
      And then:

      ```
      nvm install iojs
      ```
      To activate iojs in every fresh opened terminal from now on use this command:

      ```
      nvm alias default iojs
      ```     

  3.  Inside repository directory install all dependencies listed in [package.json](./package.json) using

      ```
      npm install
      ```

      This will install [gulp][] in `node_modules/.bin/gulp` among other things.

      `npm` is installed along with `node.js` or `io.js`, so you should already have it.

  4.  Run:

  ```
  node_modules/.bin/gulp serve
  ```

      This will:

  * Compile your code into `build/` directory
  * Start watching for changes and rebuild when necessary
  * Start a local web server on port 8000
  * Open your web browser and point it to this server

  5.  You are ready! Now just make changes to the code and in few seconds they should be reflected in the browser.

[nvm]:  https://github.com/creationix/nvm
[gulp]: http://gulpjs.com/
