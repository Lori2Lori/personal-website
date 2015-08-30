# Eats teacup-views and spits html

gulp       = require 'gulp'
through    = require 'through2'
rename     = require "gulp-rename"
notify     = require 'gulp-notify'
del        = require 'del'
html_valid = require 'gulp-w3cjs'
fs         = require 'fs'
path       = require 'path'
matter     = require 'yaml-front-matter'
stylus     = require 'gulp-stylus'

options = # defaults 'teacup',
  sources     : 'html/**/*'
  style       : 'css/index.styl'
  destination : 'build/'
  assets      : 'assets/**/*'
  content     : 'content/**/*.md'

module.exports = options

posts = []
gulp.task 'posts', ->
  # Create html file for each .md file in content directory.
  # Clear require cache - otherwise changes to template won't be reflected
  tpl_path = path.resolve './html/post.coffee'
  require.cache[tpl_path] = null
  template = require tpl_path

  posts = []

  gulp
    .src options.content
    .pipe through.obj (file, enc, done) ->
      md = file.contents.toString enc

      post = matter.loadFront md
      file.title = post.title

      html = template post
      file.contents = new Buffer html
      @push file
      do done
    .pipe rename extname: '.html'
    .pipe gulp.dest options.destination
    .pipe through.obj (file, enc, done) ->

      # Add title and file.path to posts array
      base = path.join __dirname, 'build'
      href = path.relative base, file.path
      title = file.title
      post = {title, href}
      posts.push post
      do done

gulp.task 'index', (done) ->
  # Create index.html file from index.coffee template and posts array.
  # The posts array is generated in 'posts' task.

  tpl_path = path.resolve './html/index.coffee'
  require.cache[tpl_path] = null
  template = require tpl_path
  html = template posts
  fs.writeFile "build/index.html", html, done

gulp.task 'css', ->
  #Create index.css file from index.styl
  gulp
    .src options.style
    .pipe stylus()
    .pipe gulp.dest 'build/css'

gulp.task 'assets', ->
  gulp
    .src options.assets
    .pipe gulp.dest options.destination

gulp.task 'build', gulp.series [
  'posts'
  'index'
  'css'
  'assets'
]

gulp.task 'watch', gulp.series [
  'build'
  (done) ->
    gulp.watch [
      options.sources
      options.content
      options.style
    ], gulp.series ['build']
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
