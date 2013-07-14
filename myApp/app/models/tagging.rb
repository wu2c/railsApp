class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :newsarticle
  # attr_accessible :title, :body
end
