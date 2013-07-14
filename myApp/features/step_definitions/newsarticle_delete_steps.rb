When /^I click link "Destroy" to delete newsarticle \"(.+)\"$/ do |title|
	newsarticle = Newsarticle.find_by_title(title)
	page.driver.submit :delete, "/newsarticles/#{newsarticle.id}", {}
end

