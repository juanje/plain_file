# append to the end
Given /^a line to append:$/ do |new_line|
  @new_line = new_line
end

When /^ask to append the line to file named "([^"]*)"$/ do |file_name|
  @aruba_file_path = File.join('tmp/aruba', file_name)
  file = PlainFile.new(@aruba_file_path)
  @re = file.append(@new_line)
end

Then /^the line "([^"]*)" should be the last one$/ do |line|
  last_line = IO.readlines(@aruba_file_path).last.chomp
  last_line.should be == line
end

# append after text
Given /^the text to append after: "([^"]*)"$/ do |text|
  @text = text
end

When /^ask to append the line the next line after that text at file named "([^"]*)"$/ do |file_name|
  @aruba_file_path = File.join('tmp/aruba', file_name)
  file = PlainFile.new(@aruba_file_path)
  @re = file.append(@new_line, @text)
end

Then /^the line "([^"]*)" should be the next to the one with the text "([^"]*)"$/ do |new_line, text|
  contents = IO.readlines(@aruba_file_path)
  contents.each do |line|
    next unless line.match(text)
    index = contents.index(line) + 1
    contents[index].chomp.should be == new_line
  end
end
