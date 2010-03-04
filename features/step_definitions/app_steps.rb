require 'rubygems'
require 'watir'

URL = "http://localhost:4567"

URLS = {
  "/" => URL + "/",
  "/sessions" => URL + "/sessions",
	"/session/Alt.NET" => URL + "/session/Alt.NET"
}

def visit (url)
  @browser.goto URLS[url]
end

Given /^I request the url "(.+)"$/ do |url|
  #visit url
  visit url
  @browser.title.should == "Code Camp Server"
end

Then /^I should see a list of "([^\"]*)"$/ do |name, list|
  # list is a Cucumber::Ast::Table
  list.raw.each {|i| @browser.link(:text, i.to_s).nil?.should == false }
end

Then /^I should see the description of the "([^\"]*)" session$/ do |name|
	@browser.text.should =~ name.to_s
end