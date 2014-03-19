require 'simplecov'
require 'simplecov-console'
require 'stringio'

SimpleCov.add_filter '/spec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console
]

SimpleCov.start

def capture_stdin(*args)
  begin
    $stdin = StringIO.new
    $stdin.puts(args.shift) until args.empty?
    $stdin.rewind
    yield
  ensure
    $stdin = STDIN
  end
end

def capture_stdout
  old = $stdout
  $stdout = fake = StringIO.new
  yield
  fake.string
ensure
  $stdout = old
end

require File.expand_path('../../lib/church', __FILE__)
