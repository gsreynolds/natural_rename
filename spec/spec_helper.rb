require 'natural_rename'
require 'pp' # https://github.com/defunkt/fakefs/issues/99
require 'fakefs'
require 'fakefs/spec_helpers'

RSpec.configure do |c|
  c.include FakeFS::SpecHelpers
end
