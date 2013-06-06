class Comment < ActiveRecord::Base
  belongs_to :newsarticle
  attr_accessible :commenter, :content
  validates :content, :presence => true
end
