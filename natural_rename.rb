#! /usr/bin/env ruby
require 'optparse'
require 'natural_rename'

options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: natural_rename.rb [list of files]'

  opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
    options[:verbose] = v
  end
end.parse!

if ARGV.count > 26**2
  puts 'Error: Maximum number of files to rename exceeded'
  exit 1
end

# Instantiate
natural_rename = NaturalRename.new(files: ARGV, verbose: options[:verbose])

# Use naturally to sort list of files supplied
natural_rename.sort

# Preserve extensions
natural_rename.preserve_extensions

# Build new name array, outer loop, inner loop.
# AA, AB, AC... BA, BC, BD... ZX, ZY, ZZ
natural_rename.generate_new_names

# Rename the files
natural_rename.rename
