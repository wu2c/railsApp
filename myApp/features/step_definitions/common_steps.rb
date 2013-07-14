Then /^I am on (.+)$/ do |page_name|
	visit path_to(page_name)
end

When /^I follow \"(.+)\"$/ do |path|
	click_link(path)
end

When /^I fill in \"(.*?)\" with \"(.*?)\"$/ do |field, value|  
	fill_in field, :with => value 
end

When /^I press \"(.*?)\"$/ do |button|
	click_button(button)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|  
	path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
	visit path_to(page_name)
end
