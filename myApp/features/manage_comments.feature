Feature: Manage Comments
  In order to show all comments for a newsarticle
  As an user
  I want to create and manage comments
  
  Scenario: Comments List
    Given I have newsarticles with title "Croods" and article "This movie is funny."
	Given I have comments with contents "This movie is also my favourite., I like this movie too." for newsarticle "Croods"
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
	And I should see "Croods"
	When I click on "Show" with titled "Croods"
	When I go to the show page of newsarticle "Croods"
	Then I should see "Comments"
	Then I should see "This movie is also my favourite."
	And I should see "I like this movie too."
	
  Scenario: Create Comment
    Given I have no comments
	Given I have newsarticles with title "Croods" and article "This movie is funny."
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
	And I should see "Croods"
	When I click on "Show" with titled "Croods"
	When I go to the show page of newsarticle "Croods"
	Then I should see "Croods"
	Then I fill in "comment_content" with "I never watched this movie. It sounds good."
	Then I press "Create Comment"
	And I should see "I never watched this movie. It sounds good."
    And I should have 1 comment 
	
  