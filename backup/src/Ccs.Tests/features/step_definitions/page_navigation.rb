#require 'spec'
#require 'watir'
#
#$BROWSER = Watir::Browser.new if $BROWSER == nil
#
#PAGE_URLS = {
#  "Home" => "localhost:8808",
#  "LogOn" => "localhost:8808/Account/LogOn",
#}
#
#Given /^I am on the (.*) page$/ do |page_name|
#  $BROWSER.goto('http://' + PAGE_URLS[page_name])
#end
#
#
#Given /^I click the (.*) link$/ do |page_name|
#	$BROWSER.link(:url, /Account\/LogOn/).click
#end
#
#