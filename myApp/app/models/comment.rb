class Comment < ActiveRecord::Base
  belongs_to :newsarticle
  attr_accessible :commenter, :content, :newsarticle_id
  validates :content, :presence => true
end
