Given /^I have newsarticles titled (.+)$/ do |titles|
	titles.split(', ').each do |title|
    	Newsarticle.create!(:name => "lucy06@gmail.com", :title => title)
	end
end

Given /^I have newsarticles with title \"(.+)\" and article \"(.+)\"$/ do |title, article|
    Newsarticle.create!(:name => "lucy06@gmail.com", :title => title, :article => article)
end

Then /^creating with invalid attributes should have validation error$/ do
	expect { post:create }.to raise_error
end