require 'rubygems'
require 'watir'

URL = "http://localhost:4567"
PAGE_TITLE = "Code Camp Server"

DATA = {
  "/" => {:url => URL + "/", :title => "#{PAGE_TITLE}"},
  "/sessions" => {:url => URL + "/sessions", :title => "#{PAGE_TITLE}::Sessions"},
	"/session/Alt.NET" => {:url => URL + "/session/Alt.NET", :title => "#{PAGE_TITLE}::Alt.NET"},
}

def visit (url)
  @browser.goto DATA[url][:url]
end

Given /^I request the url "(.+)"$/ do |url|
  #visit url
  visit url
  @browser.title.should == DATA[url][:title]
end

Then /^I should see a list of "([^\"]*)"$/ do |name, list|
  # list is a Cucumber::Ast::Table
  list.raw.each {|i| @browser.link(:text, i.to_s).nil?.should == false }
end

Then /^I should see the "([^\"]*)" page$/ do |title|
	@browser.title.should == title
end