Feature:   People want to be able to submit their talks to the code camp
  In order to have my talk considered for the code camp
  As a prospective speaker
  I want to be able to submit my talk for review


  Scenario: The site is currently accepting submissions.
    When I go to the submission page
    And the site is accepting submissions
    And I fill in "Full Name" with "A Valid Name"
    And I fill in "Title" with "A Valid Title"
    And I fill in "Description" with "A valid description of my talk."
    And I fill in "Email" with "valid@email.com"
    And I fill in "Homepage" with "http://www.valid.com"
    And I fill in "Biography" with "A valid biography of the speaker."
    And I submit my talk
    Then I should see a message confirming my submission
    And I should receive an email confirmation


  Scenario: The site is not currently accepting submissions.
    When I go to the submission page
    And the site is not accepting submissions
    Then I should be shown a message that the site is not currently accepting submissions.