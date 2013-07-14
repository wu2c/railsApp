Then /^I should have ([0-9]+) comment$/ do |count|
  	Comment.count.should == count.to_i
end

Given /^I have no comments$/ do
  	Comment.delete_all
end



