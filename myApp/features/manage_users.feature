Feature: Manage Users
  In order to log in
  As an user
  I want to sign up as a new user
  
  Scenario: Create a new User with valid attributes
	Given I am on the home page
	When I follow "Or Register"
	When I register as an user with valid attributes
	Then I should be on the home page
	Then I should see "Hello, lucy06@gmail.com"
	And I should have 1 user
	
  Scenario: Create a new User with Invalid attributes
	Given I am on the home page
	When I follow "Or Register"
	Then I should see "New User Sign Up"  
    When I fill in "user_email" with "lucy06"
	When I fill in "user_password" with "auckland"
	When I fill in "user_password_confirmation" with "auckland"
	When I press "Create User"
	Then creating with invalid attributes should have validation error
	When I fill in "user_email" with "lucy06@gmail.com"
	When I fill in "user_password" with "akl"
	When I fill in "user_password_confirmation" with "akl"
	When I press "Create User"
	Then creating with invalid attributes should have validation error
	When I fill in "user_email" with "lucy06@gmail.com"
	When I fill in "user_password" with "auckland"
	When I fill in "user_password_confirmation" with "wellington"
	When I press "Create User"
	Then creating with invalid attributes should have validation error
  
  Scenario: Cannot create as a duplicate User
    Given I have an existing user account with "lucy06@gmail.com" and "auckland"
	And I am on the home page
	When I follow "Or Register"
	Then I should see "New User Sign Up"  
    When I fill in "user_email" with "lucy06@gmail.com"
	When I fill in "user_password" with "auckland"
	When I fill in "user_password_confirmation" with "auckland"
	When I press "Create User"
	Then creating with invalid attributes should have validation error
  