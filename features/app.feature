Feature: View CCS Application

  Scenario: I want to see the CCS index page
    Given I request the url "/"
    Then I should see "Hello, world"

  Scenario: I want to see a list of speakers
    Given I request the url "/speakers"
    Then I should see a list of "speakers"

  Scenario: I want to see a list of sessions
    Given I request the url "/sessions"
    Then I should see a list of "sessions"

  Scenario: I want to see a specific speaker's profile

  Scenario: I want to see a specific session's information