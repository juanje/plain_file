require 'fileutils'

class PlainFile
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @contents = IO.readlines @file_path
  end

  def replace(current_line, new_line)
    replaced = false
    
    open(@file_path, 'w') do |new_file|
      @contents.each do |line|
        if line.chomp == current_line.chomp
          new_file.puts new_line
          replaced = true
        else
          new_file.puts line
        end
      end
    end

    replaced
  end

  def append(new_line, text='')
    appended = false

    open(@file_path, 'w') do |new_file|
      @contents.each do |line|
        new_file.puts line
        (new_file.puts new_line ; appended = true)  if line.match(text) 
      end
      (new_file.puts new_line ; appended = true) if text.empty?
    end

    appended
  end

  def to_s
    "#<PlainFile @file_path=\"#@file_path\">"
  end
end
