Feature: Guest browsing Speakers
  As a guest user.
  I need to see a list of speakers to determine who is presenting at the codecamp.

  Scenario: Requesting the Speakers page
    Given I am on the Home page
    When I click on the Speakers link
    Then I should be taken to the Speakers page

  Scenario: There are no Speakers registered for the CodeCamp.
    Given I am on the Speakers page
    Then I should see the "No Speakers" message.

  Scenario: There is 1 Speaker registered for the CodeCamp.
    Given I am on the Speakers page
    And there is 1 Speaker registered
    Then I should see 1 Speaker profile.

  Scenario: There are more than 5 Speakers registered for the CodeCamp.
    Given I am on the Speakers page
    And there are 5 Speakers registered
    Then I should see 5 Speaker profiles
    And I should see a "Next Page" link

  Scenario: There are 6 Speakers and I am viewing page 2
    Given I am on the Speakers page
    And there are 5 Speakers registered
    And I click on the "Next Page" link
    Then I should see a "Previous Page" link
    
  