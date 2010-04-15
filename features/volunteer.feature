Feature: People want to be able to submit their talks to the code camp

  Scenario: The site is currently accepting volunteers.
    When I go to the volunteer page
    And the site is accepting volunteers
    And I fill in "Full Name" with "A Valid Name"
    And I fill in "Email" with "valid@email.com"
    And I submit my contact details
    Then I should see a message confirming that I have volunteered
    And I should receive an email confirmation


  Scenario: The site is not currently accepting volunteers.
    When I go to the volunteer page
    And the site is not accepting volunteers
    Then I should be shown a message that the site is not currently accepting volunteers.