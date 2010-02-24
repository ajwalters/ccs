Feature: Logging on as an Administrator
  In order to manage the CCS website
  I need to be able to logon as an Administrator.

  Scenario: Entering Bad Credentials
    Given I am on the Home page
    Given I click the LogOn link
    When I enter the username/pw "test_admin/incorrect"
    Then I should see the "Not Authorized" message

  Scenario: Entering Good Credentials
    Given I am on the LogOn page
    When I enter the username/pw "test_admin/correct"
    Then I should see the "Welcome" message

  Scenario: Logging out
    Given I am logged in as an Administrator
    When I click the LogOff link
    Then I should see the LogOn link