Feature: Merge Articles
  As an admin
  In order to avoid having many similar articles on the same topic
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    And the following articles exist:
			| title                         | published |
			| article about this topic      | true      |
			| article about this same topic | true      |
  
  Scenario: admin can merge articles
    And I am logged into the admin panel
    When I go to the edit page of "article about this topic"
    Then I should see "Merge Articles"
    
  Scenario: non admin cannot merge articles
    And I am logged into the non-admin panel
    When I go to the edit page of "article about this topic"
    Then I should not see "Merge Articles"
    
  Scenario: should not be able to merge new article
    And I am logged into the admin panel
    When I go to the new article page
    Then I should not see "Merge Articles"