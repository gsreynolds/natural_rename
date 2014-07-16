#
# Natural Rename:
# * takes a list of files as input
# * sorts the list using Naturally
# * creates an array of the file extensions
# * creates an array of new file names in the format AA, AB, AC... BA, BC, BD... ZX, ZY, ZZ
#   which preserves the natural order of the files on systems/applications that use ASCII ordering
# * renames the files to their new names
#

require 'naturally'

class NaturalRename
  attr_reader :files, :new_names
  def initialize(files: files, verbose: verbose = false)
    @files = Naturally.sort(files)
    @verbose = verbose
    @passes = (files.count / 26.0).ceil - 1
    @alphabet = ('A'..'Z').to_a

    @extensions = preserve_extensions
    @new_names = generate_new_names
  end

  def rename
    @files.each_with_index do |f, index|
      puts "Renaming #{f} to #{@new_names[index]}#{@extensions[index]}" if @verbose
      File.rename(f, "#{@new_names[index]}#{@extensions[index]}")
    end
  end

  private

  def preserve_extensions
    extensions = []
    @files.each do |f|
      extensions << File.extname(f)
    end
    extensions
  end

  def generate_new_names
    # Build new name array, outer loop for first char, inner loop for second.
    # AA, AB, AC... BA, BC, BD... ZX, ZY, ZZ
    # in nearest multiple of 26 >= required number
    new_names = []
    (0..@passes).each do |i|
      (0..25).each do |x|
        new_names << "#{@alphabet[i]}#{@alphabet[x]}"
      end
    end
    new_names
  end
end
