Feature: Administrator managing Sessions
  As an Administrator
  I need to be able to manage the Sessions for the CodeCamp.

  Scenario: I need to be able to create a new Session
    Given I am logged in as an Administrator
    And I am on the Sessions page
    Then I should see a "Create New Session" link

  Scenario: Create a new Session.
    Given I am logged in as an Administrator
    And I am on the "New Session" page
    When I type "Penelope" into the "name" field
    And I type "Penelope is very cute." into the "biography" field
    And I submit the form
    Then I should see the Session profile page for "Penelope"
    And the biography should say "Penelope is very cute."
 
  Scenario: I need to be able to delete a Session
    Given I am logged in as an Administrator
    And I am on the Sessions page
    When there is a Session named "Penelope" registered
    Then I should see the "Delete Session" link
    
  Scenario: Confirm that I want to delete a Session
    Given I am logged in as an Administrator
    And I am on the Sessions page
    And there is a Session named "Penelope" registered
    When I click the "Delete Session" link
    Then I should see a "Are you sure you want to delete this Session?" message
  
  Scenario: Cancel deleting a Session
    Given I am attempting to delete a Session named "Penelope"
    When I click the "cancel" link
    Then I should see the Sessions page
    And the Session should not be deleted
    
  Scenario: Continue deleting a Session
    Given I am attempting to delete a Session named "Penelope"
    When I click the "continue" link
    Then the Session named "Penelope" should no longer be displayed.
    
  Scenario: I need to be able to edit a Session.
    Given I am logged in as an Administrator
    And I am on the Sessions page
    When there is a Session named "Penelope" registered
    Then I should see the "Edit Session" link
    
  Scenario: Edit a Session
    Given I am logged in as an Administrator
    And I am on the "Edit Session" page
    When I type "Penelope Hall" into the "name" field
    And I type "No, really. She is very cute."
    And I submit the form
    Then I should see the Session profile page for "Penelope Hall"
    And the biography should say "No, really. She is very cute."