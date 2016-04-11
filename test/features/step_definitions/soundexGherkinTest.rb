require File.dirname(__FILE__) + '/../../../src/my_soundex.rb'

Given(/^A soundex instance$/) do
  @soundex = MySoundex.new
end

When(/^I enter a word as "([^"]*)"$/) do |arg|
  print 'When I enter a word as ', arg, "\n"
  @encoded = @soundex.encode arg
end

Then(/^it is encoded to "([^"]*)"$/) do |arg|
  print 'Then it is encoded to ', arg, "\n"
  expect(@encoded).to eq arg
end

When(/^I enter the word "([^"]*)"$/) do |arg|
  print 'When I enter the word ', arg, "\n"
  @encoded = @soundex.encode arg
end

Then(/^the encoded length is equal to "([^"]*)"$/) do |arg|
  print 'Then the encoded length is equal to ', arg, "\n"
  expect(@encoded.length).to eq arg.to_i
end

When(/^I enter the lower case word "([^"]*)"$/) do |arg|
  print 'When I enter the lower case word ', arg, "\n"
  @encoded = @soundex.encode arg
end

Then(/^the encoded first letter is equal to "([^"]*)"$/) do |arg|
  print 'Then the encoded first letter is equal to ', arg, "\n"
  expect(@encoded[0]).to eq arg
end

When(/^I enter the character "([^"]*)"$/) do |arg|
  print 'When I enter the character ', arg, "\n"
  @encoded = @soundex.encoded_digit arg
end

Then(/^it is equal to other encoded character "([^"]*)"$/) do |arg|
  print 'Then it is equal to other encoded character ', arg, "\n"
  other_encoded_digit = @soundex.encoded_digit arg
  expect(@encoded).to eq other_encoded_digit
end

When(/^I enter the string "([^"]*)"$/) do |arg|
  print 'When I enter the string ', arg, "\n"
  @encoded = @soundex.encode arg
end

Then(/^it is equal to other encoded string "([^"]*)"$/) do |arg|
  print 'Then it is equal to other encoded string ', arg, "\n"
  other_encoded = @soundex.encode arg
  expect(@encoded).to eq other_encoded
end