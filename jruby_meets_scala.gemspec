# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "jruby_meets_scala"
  s.version     = "0.1.0"
  s.authors     = "Martin Mauch"
  s.email       = "martin.mauch@gmail.com"
  s.homepage    = "http://github.com/RubyAndScala/jruby_meets_scala"
  s.summary     = "Compiled against JRuby 1.7.4/Scala 2.10.2"
  s.description = "Example project using JRuby and Scala. See README.md for more info."

  s.files        = Dir.glob("lib/**/*") + %w(README.md ext/dist/jruby_meets_scala.jar)
  s.require_path = 'lib'
  s.add_development_dependency('rspec')
  s.add_development_dependency('guard')
  s.add_development_dependency('guard-rspec-jruby')
  s.add_development_dependency('guard-bundler')
end
