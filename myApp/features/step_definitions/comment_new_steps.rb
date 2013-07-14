Given /^I have comments with contents \"(.+)\" for newsarticle \"(.+)\"$/ do |contents, title|
	newsarticle = Newsarticle.find_by_title(title)
	contents.split(', ').each do |content|
    	Comment.create!(:content => content, :newsarticle_id => newsarticle.id)
	end
end



