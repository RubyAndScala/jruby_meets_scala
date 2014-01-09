JRuby meets Scala
=================

This project can be used as a template on how to setup a JRuby gem that includes Scala sources.
The Scala stuff is in the `ext` directory.

How to start
------------
Open a terminal window and run
```bash
cd ext
sbt ~compile
```
This will run SBT (the main Scala build tool) in continuous compilation mode, i.e. it will recompile on every change.


Open another terminal window and run
```
chruby jruby
# Alternatively use RVM / rbenv at your own peril ;)
gem install bundler
bundle install
bundle exec guard
```
This will run guard to continuously run tests. Guard will also pick up changes in Scala as it watches for changes in `.class` files that SBT creates/overwrites on changes.

Slides
------
There are also some slides in the `slides` directory. They can be compiled into HTML by
```bash
cd slides
gem install slideshow
slideshow install impress.js
slideshow build jruby_meets_scala.text -t impress.js
```

The slides are precompiled and can be accessed [here](http://RubyAndScala.github.io/jruby_meets_scala/slides/jruby_meets_scala.html).

