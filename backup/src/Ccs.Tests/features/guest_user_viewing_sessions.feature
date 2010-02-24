Feature: Guest browsing Sessions
  As a guest user.
  I need to see a list of Sessions to determine what sessions are being presented at the codecamp.

  Scenario: Requesting the Sessions page
    Given I am on the Home page
    When I click on the Sessions link
    Then I should be taken to the Sessions page

  Scenario: There are no Sessions registered for the CodeCamp.
    Given I am on the Sessions page
    Then I should see the "No Sessions" message.

  Scenario: There is 1 Session registered for the CodeCamp.
    Given I am on the Sessions page
    And there is 1 Session registered
    Then I should see 1 Session profile.

  Scenario: There are more than 5 Sessions registered for the CodeCamp.
    Given I am on the Sessions page
    And there are 5 Sessions registered
    Then I should see 5 Session profiles
    And I should see a "Next Page" link

  Scenario: There are 6 Sessions and I am viewing page 2
    Given I am on the Sessions page
    And there are 5 Sessions registered
    And I click on the "Next Page" link
    Then I should see a "Previous Page" link
    
  