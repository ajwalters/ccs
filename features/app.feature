Feature: View CCS Application

  Scenario: I want to see the CCS index page
    Given I request the url "/"
    Then I should see a list of "sections"
      |Speakers|
      |Sessions|
      |Agenda|
      |Sponsors|
      |Directions|