# Eats teacup-views and spits html

gulp       = require 'gulp'
through    = require 'through2'
rename     = require "gulp-rename"
notify     = require 'gulp-notify'
del        = require 'del'
html_valid = require 'gulp-w3cjs'
fs         = require 'fs'

options = # defaults 'teacup',
  sources     : 'html/**/*'
  destination : 'build/'
  assets      : 'assets/**/*'
  content     : 'content/**/*.md'

module.exports = options

titles = []
gulp.task 'posts', ->
  # Create html file for each .md file in content directory.
  template = require './html/post.coffee'
  titles = []

  gulp
    .src options.content
    .pipe through.obj (file, enc, done) ->
      md = file.contents.toString enc

      # Extract title from markdown string.
      title = md
        .split('\n')[0]
        .replace /^\#/, ""
      titles.push title

      html = template md
      file.contents = new Buffer html
      @push file
      do done
    .pipe rename extname: '.html'
    .pipe gulp.dest options.destination

gulp.task 'index', (done) ->
  # Create index.html file from index.coffee template and titles array.
  # The titles array is generated in 'posts' task.
  template = require './html/index.coffee'
  html = template titles
  fs.writeFile "build/index.html", html, done

gulp.task 'assets', ->
  gulp
    .src options.assets
    .pipe gulp.dest options.destination

gulp.task 'build', gulp.series [
  'posts'
  'index'
  'assets'
]

gulp.task 'watch', gulp.series [
  'build'
  (done) ->
    gulp.watch [options.sources, options.content], gulp.series ['build']
    gulp.watch options.assets, gulp.series ['assets']
]

gulp.task 'clean', (done) ->
  del options.destination, done

webserver = require 'gulp-webserver',

gulp.task 'serve', gulp.parallel [
  'watch'
  ->
    gulp
      .src options.destination
      .pipe webserver
        livereload: true,
        open: true
]
