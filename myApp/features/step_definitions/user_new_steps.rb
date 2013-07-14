When /^I register as an user with valid attributes$/ do
	step 'I fill in "user_email" with "lucy06@gmail.com"'
	step 'I fill in "user_password" with "auckland"'
	step 'I fill in "user_password_confirmation" with "auckland"'
	step 'I press "Create User"'
end

Given /^I am an user with \"(.+)\" and \"(.+)\"$/ do |email, pw|
	user = FactoryGirl.create(:user, email: email, password: pw)
end

Given /^I have an existing user account with \"(.+)\" and \"(.+)\"$/ do |email, pw|
	User.create(:email => email, :password => pw)
end

Then /^I should have ([0-9]+) user$/ do |count|
  	User.count.should == count.to_i
end