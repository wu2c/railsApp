Feature: Show Newsarticles
  In order to see a newsarticle and related information
  As an user
  I want to view a newsarticle
  
  Scenario: Show newsarticle
	Given I have newsarticles with title "Croods" and article "This movie is funny."
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
	And I should see "Croods"
	When I click on "Show" with titled "Croods"
	When I go to the show page of newsarticle "Croods"
	Then I should see "Croods"
	Then I should see "This movie is funny."
	Then I should see "Tags"
	Then I should see "Add a comment"
	Then I should see "Comments"
	
  