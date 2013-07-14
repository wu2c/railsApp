class Tag < ActiveRecord::Base
  belongs_to :newsarticle
  attr_accessible :tagname
  has_many :taggings
  has_many :newsarticles, :through => :taggings
  
  def self.tagged_with(tag_name)
 	 Newsarticle.joins(:tags).where(tags: { tagname: tag_name })
	   
  end
  
  def self.tag_list(tags)
    tags.map(&:tagname).join(", ")
  end
  
  def self.tag_counts
    Tag.select("tags.*, count(tags.id) as count")
      .find(:all, :group => :tagname)
  end
  
  def self.tag_list=(tagnames)
    self.tags = tagnames.split(",").map do |n|
      Tag.where(tagname: n.strip).first_or_create!
    end
  end

end