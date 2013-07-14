Feature: Delete Newsarticles
  In order to remove a newsarticle and related information
  As an user
  I want to delete a newsarticle
  
  Scenario: Delete a newsarticle
	Given I have newsarticles titled Wellington, Weather
	Given I am an user with "lucy06@gmail.com" and "auckland"
	And I am on the home page
	When I fill in "email" with "lucy06@gmail.com"
	When I fill in "password" with "auckland"
	When I press "Log In"
	Then I should be on the home page
	Then I should see "lucy06@gmail.com"
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
	Then I should see "Wellington"
	And I should see "Weather"
	When I click link "Destroy" to delete newsarticle "Weather"
	Then I should be on the list of newsarticles
	Then I should have 1 newsarticle
	
  Scenario: Cannot Delete Newsarticle Without Log In
    And I have newsarticles titled Wellington, Weather
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
    Then I should see "Wellington"
	And I should see "Weather"
	When I click link "Destroy" to delete newsarticle "Weather"
	Then I should be on the session page
	Then I should see "You need to log in first! Or register, if don't have an account."
	Then I should have 2 newsarticle
	 
  Scenario: Only the Owner of the newsarticle Allow to Delete 
	Given I have newsarticles titled Wellington, Weather
	Given I am an user with "apple12@gmail.com" and "123456"
	And I am on the home page
	When I fill in "email" with "apple12@gmail.com"
	When I fill in "password" with "123456"
	When I press "Log In"
	Then I should be on the home page
	Then I should see "apple12@gmail.com"
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
	Then I should see "Wellington"
	And I should see "Weather"
	When I click link "Destroy" to delete newsarticle "Weather"
	Then I should be on the list of newsarticles
	Then I should see "You are not allowed to make any changes to this article!"
	Then I should have 2 newsarticle
  
	
  