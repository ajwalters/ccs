require 'watir'

URL = "http://localhost:4567"
PAGE_TITLE = "Chicago Code Camp"

DATA = {
  "/" => {:url => "#{URL}/", :title => "#{PAGE_TITLE} => Home"},
  "/sessions" => {:url => "#{URL}/sessions", :title => "#{PAGE_TITLE} => Sessions"},
	"/session/Alt.NET" => {:url => "#{URL}/session/Alt.NET", :title => "#{PAGE_TITLE} => Alt.NET"},
	"/speakers" => {:url => "#{URL}/speakers", :title => "#{PAGE_TITLE} => Speakers"},
	"/speaker/sseely" => {:url => "#{URL}/speaker/sseely", :title => "#{PAGE_TITLE} => Scott Seely"},
} 

def visit (url)
  puts DATA[url][:url]
  @browser.goto DATA[url][:url]
end

Given /^I request the url "(.+)"$/ do |url|
  visit url
  puts DATA[url][:title]
  @browser.title.should == DATA[url][:title]
end

Then /^I should see a list of "([^\"]*)"$/ do |name, list|
  # list is a Cucumber::Ast::Table
  list.raw.each {|i| @browser.link(:text, i.to_s).nil?.should == false }
end

Then /^I should see the "([^\"]*)" page$/ do |title|
	@browser.title.should == title
end

Then /^I should see a list of navigation options$/ do |list|
  # table is a Cucumber::Ast::Table
  list.raw.each {|i| @browser.div(:id, "navigation").link(:text, i.to_s).nil?.should == false }
end

Then /^I should see an "([^\"]*)" link$/ do |id|
  @browser.link(:id, id).nil?.should == false
end
