class Newsarticle < ActiveRecord::Base
  attr_accessible :article, :name, :title
  validates :name, :presence => true
  validates :title, :presence => true, :length => {:minimum => 5}
  
  has_many :comments
end
