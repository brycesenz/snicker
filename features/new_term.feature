Feature: Adding a new term
  In order to see new stupid tweets
  As a visitor
  I want to add a new search term

  Background:
    Given I am on the home page
    And I click "Add New Term"
  

  Scenario: Without search text
    Then I should be on the new_term page
    When I press "Add Term"
    Then I should be on the terms page
    And I should see error "can't be blank" on "term_search_text" 

  Scenario: With search text
    Then I should be on the new_term page
    When I fill in "term_search_text" with "Yolo"
    And I press "Add Term"
    Then I should be on the home page
    And I should see flash notice "Added new term"
    