class Newsarticle < ActiveRecord::Base
  attr_accessible :article, :name, :title, :tags_attributes, :tag_list
  validates :name, :presence => true
  validates :title, :presence => true, :length => {:minimum => 5}
  
  has_many :comments
  has_many :tags
  has_many :taggings
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
  	:reject_if => proc {|attrs| attrs.all? {|k,v|v.blank?}}
	
 
end
