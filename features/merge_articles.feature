Feature: Merge Articles
  As an admin
  In order to avoid having many similar articles on the same topic
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Merged article should contain text of both articles
    And the following articles exist:
			| title                           | body              |
			| article about this topic        | content article 1 |
			| article about this same topic   | content article 2 |
    When I go to the edit page of "article about this topic"
    And I fill in the merge field with "article about this same topic"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the view page for "article about this topic"
    Then I should see "content article 1"
    And I should see "content article 2"
    
  Scenario: Merged article should have the author of the first article
    And the following articles exist:
			| title                           | author    |
			| article about this topic        | author 1  |
			| article about this same topic   | author 2  |
    When I go to the edit page of "article about this topic"
    And I fill in the merge field with "article about this same topic"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the view page for "article about this topic"
    Then I should see "author 1"
    And I should not see "author 2"
    
  Scenario: Merged article shoud have the title of the first article
    And the following articles exist:
			| title                           | published |
			| article about this topic        | true      |
			| article about this same topic   | true      |
    When I go to the edit page of "article about this topic"
    And I fill in the merge field with "article about this same topic"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the view page for "article about this topic"
    Then I should see "article about this topic"
    And I should not see "article about this same topic"
    
  Scenario: Merged article should have comments from both articles, checking the cumulative count
    And the following articles exist:
			| title                           | published |
			| article about this topic        | true      |
			| article about this same topic   | true      |
    And article "article about this topic" has 3 comments
    And article "article about this same topic" has 2 comments
    When I go to the edit page of "article about this topic"
    And I fill in the merge field with "article about this same topic"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the view page for "article about this topic"
    Then I should see "5 comments"