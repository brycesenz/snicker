Feature: Viewer visits the home page
  In order to read the page
  As an anonymous user
  I want to see the home page of my app

  Scenario: View home page 
    Given I am on the home page
    Then I should see link "Add New Term"
    