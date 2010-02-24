Feature: Administrator managing Speakers
  As an Administrator
  I need to be able to manage the Speakers for the CodeCamp.

  Scenario: I need to be able to create a new Speaker
    Given I am logged in as an Administrator
    And I am on the Speakers page
    Then I should see a "Create New Speaker" link

  Scenario: Create a new Speaker.
    Given I am logged in as an Administrator
    And I am on the "New Speaker" page
    When I type "Penelope" into the "name" field
    And I type "Penelope is very cute." into the "biography" field
    And I submit the form
    Then I should see the Speaker profile page for "Penelope"
    And the biography should say "Penelope is very cute."

  Scenario: I need to be able to delete a Speaker
    Given I am logged in as an Administrator
    And I am on the Speakers page
    When there is a Speaker named "Penelope" registered
    Then I should see the "Delete Speaker" link

  Scenario: Confirm that I want to delete a Speaker
    Given I am logged in as an Administrator
    And I am on the Speakers page
    And there is a Speaker named "Penelope" registered
    When I click the "Delete Speaker" link
    Then I should see a "Are you sure you want to delete this speaker?" message

  Scenario: Cancel deleting a Speaker
    Given I am attempting to delete a Speaker named "Penelope"
    When I click the "cancel" link
    Then I should see the Speakers page
    And the Speaker should not be deleted

  Scenario: Continue deleting a Speaker
    Given I am attempting to delete a Speaker named "Penelope"
    When I click the "continue" link
    Then the Speaker named "Penelope" should no longer be displayed.

  Scenario: I need to be able to edit a Speaker.
    Given I am logged in as an Administrator
    And I am on the Speakers page
    When there is a Speaker named "Penelope" registered
    Then I should see the "Edit Speaker" link

  Scenario: Edit a Speaker
    Given I am logged in as an Administrator
    And I am on the "Edit Speaker" page
    When I type "Penelope Hall" into the "name" field
    And I type "No, really. She is very cute."
    And I submit the form
    Then I should see the Speaker profile page for "Penelope Hall"
    And the biography should say "No, really. She is very cute."