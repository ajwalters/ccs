Given /^I request the url "(.+)"$/ do |url|
  visit(url)
end

Then /^I should see "(.+)"$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end