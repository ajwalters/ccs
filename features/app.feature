 Feature: view home page

   Scenario: Home page
     Given I request the url "/"
     Then I should see "Hello, world"