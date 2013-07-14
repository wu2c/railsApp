module NavigationHelpers
def path_to(page_name)
 case page_name
	when /the list of newsarticles/
	  newsarticles_path
	when /the home page/
	  root_path
	when /edit for newsarticle \"(.+)\"$/
	  newsarticle = Newsarticle.find_by_title($1)
	  edit_newsarticle_path(newsarticle.id)
	when /the show page of newsarticle \"(.+)\"$/
	  newsarticle = Newsarticle.find_by_title($1)
	  newsarticle_path(newsarticle.id)
	when /the session page/
		new_session_path  
	else        
		raise "Can't find mapping from \"#{page_name}\" to a path."    
	end
end
end

World(NavigationHelpers)

