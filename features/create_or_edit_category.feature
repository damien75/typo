Feature: Create Category
  As an admin
  In order to allow authors to post with a more categories
  I want to add a new category to the ones that already exist
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: Go to the Categories page
    Given I am on the admin home page
    Then I should see "Categories"
    When I follow "Categories"
    Then I should be on the Categories page
    
  Scenario: Successfully create Category
    Given I am on the Categories page
    When I fill in "category_name" with "new sample category"
    And I fill in "category_keywords" with "test"
    And I fill in "category_description" with "this category is for test purposes only"
    And I press "Save"
    Then I should be on the Categories page
    And I should see "new sample category"
    And I should see "test"
    And I should see "this category is for test purposes only"
    
  Scenario: Cancel create category
    Given I am on the Categories page
    When I fill in "category_name" with "new cancelled sample category"
    And I fill in "category_keywords" with "test cancelled"
    And I fill in "category_description" with "this cancelled category is for test purposes only"
    And I follow "Cancel"
    Then I should be on the Categories page
    And I should not see "new cancelled sample category"
    And I should not see "test cancelled"
    And I should not see "this cancelled category is for test purposes only"
    
  Scenario: Successfully Edit category
    Given I am on the Categories page
    When I follow "Edit"
    When I fill in "category_name" with "new edited sample category"
    And I fill in "category_keywords" with "edited test"
    And I fill in "category_description" with "this edited category is for test purposes only"
    And I press "Save"
    Then I should be on the Categories page
    And I should see "new edited sample category"
    And I should see "edited test"
    And I should see "this edited category is for test purposes only"
    
  Scenario: Cancel Edit category
    Given I am on the Categories page
    When I follow "Edit"
    When I fill in "category_name" with "new cancelled edited sample category"
    And I fill in "category_keywords" with "cancelled edited test"
    And I fill in "category_description" with "this cancelled edited category is for test purposes only"
    And I follow "Cancel"
    Then I should be on the Categories page
    And I should not see "new cancelled edited sample category"
    And I should not see "cancelled edited test"
    And I should not see "this cancelled edited category is for test purposes only"
