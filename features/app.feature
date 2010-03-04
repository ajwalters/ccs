Feature: View CCS Application

  Scenario: I want to see the CCS index page
    Given I request the url "/"
    Then I should see a list of "sections"
      |Speakers|
      |Sessions|

  Scenario: I want to see a list of Sessions
    Given I request the url "/sessions"
    Then I should see a list of "Sessions"
      |Alt.NET|
      |All.NET|
      |Not.NET|

	Scenario: I want to see a Sessions information
		Given I request the url "/session/Alt.NET"
		Then I should see the description of the "Alt.NET" session