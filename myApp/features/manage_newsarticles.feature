Feature: Manage Newsarticles
  In order to make a newsarticle application
  As an user
  I want to create and manage newsarticles
  
  Scenario: Newsarticles List
	Given I have newsarticles titled Wellington, Weather
	When I go to the list of newsarticles
	Then I should see "Wellington"
	And I should see "Weather"
	
  Scenario: Create Valid Newsarticle
    Given I have no newsarticles
	And I am on the home page
	When I follow "Or Register"
	When I register as an user with valid attributes
	Then I should be on the home page
	Then I should see "lucy06@gmail.com"
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
    When I follow "+Create Newsarticle"
    When I fill in "Title" with "A new movie coming soon"
    When I fill in "Article" with "The croods is nice and funny."
    And I press "Create Newsarticle"
    Then I should see "A new movie coming soon"
    And I should see "The croods is nice and funny."
    And I should have 1 newsarticle

  Scenario: Create Invalid Newsarticle
    Given I have no newsarticles
	And I am on the home page
	When I follow "Or Register"
	When I register as an user with valid attributes
	Then I should be on the home page
	Then I should see "lucy06@gmail.com"
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
    When I follow "+Create Newsarticle"
    When I fill in "Title" with ""
    When I fill in "Article" with ""
    And I press "Create Newsarticle"
    Then creating with invalid attributes should have validation error
	When I fill in "Title" with "new"
    And I press "Create Newsarticle"
    Then creating with invalid attributes should have validation error
	
  Scenario: Cannot Create Newsarticle Without Log In
    Given I have no newsarticles
	And I am on the home page
	When I follow "Newsarticles"
    Then I am on the list of newsarticles
    When I follow "+Create Newsarticle"
	Then I should be on the home page
	Then I should see "You need to log in first! Or register, if don't have an account"
