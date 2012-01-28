Given /^a line to be replaced:$/ do |current_line|
  @current_line = current_line
end

Given /^a line to replace with:$/ do |new_line|
  @new_line = new_line
end

When /^ask to replace one line with the other at file named "([^"]*)"$/ do |file_name|
  aruba_file_path = File.join('tmp/aruba', file_name)
  file = PlainFile.new(aruba_file_path)
  @re = file.replace(@current_line, @new_line)
end

Then /^it should return (true|false)$/ do |re|
  @re.to_s.should be == re
end

