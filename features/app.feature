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
		Then I should see the "Chicago Code Camp => Alt.NET" page
		
  Scenario: I want to see a list of Speakers
    Given I request the url "/speakers"
    Then I should see a list of "Speakers"
      |sseely|Scott Seely|
      |spereira|Sergio Pereira|
      |just3ws|Michael D. Hall|

  Scenario: I want to see a navigation bar.
    Given I request the url "/"
    Then I should see a list of navigation options
     |Home|
     |Speakers|
     |Sessions|
     
  Scenario: I want to edit a speaker
    Given I request the url "/speaker/sseely"
    Then I should see an "edit" link