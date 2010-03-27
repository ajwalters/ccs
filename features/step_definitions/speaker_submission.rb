Given /^I have a talk I want to submit$/ do
end

When /^I visit the home page$/ do
    visit 'http://localhost:4567/'
end

Then /^I should be able to submit a my talk details$/ do |table|
  # table is a Cucumber::Ast::Table
  table.rows.each do |c1, c2|
    fill_in c1.downcase.gsub(" ", "_"), :with => c2
  end
  click_button "submit"
end
