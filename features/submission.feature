Feature: People want to be able to submit their talks to the code camp


  Scenario: I want to be able to submit my talk to the code camp.
    Given I have a talk I want to submit
    When I visit the home page
    Then I should be able to submit a my talk details 
      |Full Name|John Q. Presenter|
      |Title|My Awesome Presentation|
      |Description|My talk is awesome, you will really like it|
      |Email|jqp@chicagocodecamp.com|
      |Homepage|http://jqp.chicagocodecamp.com|
      |Biography|I am person who wants to talk at the code camp.|
