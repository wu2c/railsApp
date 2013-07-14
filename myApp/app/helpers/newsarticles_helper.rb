module NewsarticlesHelper
	def join_tags(newsarticle)
		newsarticle.tags.map{|t| raw(link_to(t.tagname, :controller => :newsarticles, :action => :index, :tag_path =>t))}.join(",")
	end
	
end
