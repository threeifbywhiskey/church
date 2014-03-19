require 'simplecov'
require 'simplecov-console'

SimpleCov.add_filter '/spec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console
]

SimpleCov.start

require File.expand_path('../../lib/church', __FILE__)
