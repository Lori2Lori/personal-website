# Eats teacup-views and spits html
#TODO: static files
gulp       = require 'gulp'
through    = require 'through2'
rename     = require "gulp-rename"
notify     = require 'gulp-notify'
del        = require 'del'
html_valid = require 'gulp-w3cjs'
# defaults  = require './defaults'

options = # defaults 'teacup',
  sources     : 'html/**/*'
  destination : 'build/'
  assets      : 'assets/**/*'

module.exports = options

gulp.task 'teacup', ->
  gulp
    .src options.sources, read: no
    .pipe through.obj (file, enc, done) ->
      # each file should be a module containing Teacup View instance
      # i.e. a function, that when called returns HTML string
      articles = [
        '''
          #This is an article
          This is some text
        '''
        '''
          #LAlala
          This is another text
        '''
      ]
      require.cache[file.path] = null # Clear cache, otherwise watch will always produce same output
      try
        view = require file.path
        html = view articles
      catch error
        console.error error
        return @emit 'error', error

      file.contents = new Buffer html
      @push file
      do done
    .on 'error', notify.onError (error) -> "Error: #{error.message}"

    .pipe rename extname: '.html'
    .pipe html_valid()
    # TODO: waiting for reply on https://github.com/callumacrae/gulp-w3cjs/issues/10
    #  .on 'error', notify.onError (error) -> "Error: #{error.message}"
    .pipe gulp.dest options.destination

gulp.task 'assets', ->
  gulp
    .src options.assets
    .pipe gulp.dest options.destination

gulp.task 'watch', ['teacup', 'assets'], ->
  gulp.watch options.sources, ['teacup']
  gulp.watch options.assets, ['assets']

gulp.task 'clean', (done) ->
  del options.destination, done

webserver = require 'gulp-webserver',

gulp.task 'serve', ['watch'], ->
  gulp
    .src options.destination
    .pipe webserver
      livereload: true,
      open: true
