#require 'spec'
#require 'watir'
#
#$BROWSER = Watir::Browser.new if $BROWSER == nil
#
#When /^I enter the username\/pw "([^\"]*)\/([^\"]*)"$/ do |username, password|
#  $BROWSER.text_field(:id, 'UserName').set(username)
#  $BROWSER.text_field(:id, 'Password').set(password)
#  $BROWSER.forms.first.submit
#end
#
#Given /^I am logged into the (.*) page$/ do |page_name|
#  Given "I am on the #{page_name} page"
#  When 'I enter the username/pw "test_admin/incorrect"'
#end
#
#
#Then /^I should see the Incorrect UserName or Password message$/ do
#  puts 'here'
#  $BROWSER.contains_text("The user name or password provided is incorrect.").should == true
#end
#
#Then /^I should see the Default page$/ do
#  pending # express the regexp above with the code you wish you had
#end
#
#Then /^I should see the Welcome message$/ do
#  pending # express the regexp above with the code you wish you had
#end