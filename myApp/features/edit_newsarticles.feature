Feature: Edit Newsarticles
  In order to update a newsarticle and related information
  As an user
  I want to edit a newsarticle
  
  Scenario: Update newsarticle with valid attributes
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
	When I click on "Edit" with titled "Weather"
	When I go to edit for newsarticle "Weather"
	Then I should see "Editing newsarticle"
	When I fill in "Title" with "Weather of Wellington this week"
	When I fill in "Article" with "It will be raining through the whole week."
	When I fill in "newsarticle_tags_attributes_0_tagname" with "Weather"
	When I press "Update Newsarticle"
	And I am on the show page of newsarticle "Weather of Wellington this week"
	Then I should see "Weather of Wellington this week"
	Then I should see "It will be raining through the whole week."
	Then I should see "Weather"
	
  Scenario: Update newsarticle with Invalid attributes
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
	When I click on "Edit" with titled "Weather"
	When I go to edit for newsarticle "Weather"
	Then I should see "Editing newsarticle"
	When I fill in "Title" with ""
	When I press "Update Newsarticle"
	Then updating with invalid attributes should have validation error
	
  Scenario: Cannot Update Newsarticle Without Log In
    Given I have newsarticles titled Wellington, Weather
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
    Then I should see "Wellington"
	And I should see "Weather"
	When I click on "Edit" with titled "Weather"
	When I go to edit for newsarticle "Weather"
	Then I should be on the session page
	Then I should see "You need to log in first! Or register, if don't have an account."
	  
  Scenario: Only the Owner of the newsarticle Allow to Update 
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
	When I click on edit for newsarticle "Weather" but I am not the owner of this article
	Then I should be on the list of newsarticles
	
  