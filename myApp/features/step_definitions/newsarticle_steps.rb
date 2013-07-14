Given /^I have no newsarticles$/ do
  	Newsarticle.delete_all
end

Then /^I should have ([0-9]+) newsarticle$/ do |count|
  	Newsarticle.count.should == count.to_i
end

When /^I click on (.+) but I am not the owner of this article$/ do |page_name|
	Capybara.current_session.driver.header 'Referer', 'https://test.host/newsarticles'
	visit path_to(page_name)
end

When /^I click on \"(.+)\" with titled \"(.+)\"$/ do |link, title|
	newsarticle = Newsarticle.find_by_title(title)
	inc = 0
	page.all('a').each do |p|
		if(link == "Edit")
			if(p[:href] == "/newsarticles/#{newsarticle.id}/edit")
				page.all('a')[inc].click
				break
			end
		else
			if(p[:href] == "/newsarticles/#{newsarticle.id}")
				page.all('a')[inc].click
				break
			end
		end
		inc +=1
	end
end
