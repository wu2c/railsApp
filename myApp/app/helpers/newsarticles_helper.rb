module NewsarticlesHelper
	def join_tags(newsarticle)
		newsarticle.tags.map{|t|t.tagname}.join(",")
	end
end
