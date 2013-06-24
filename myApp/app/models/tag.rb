class Tag < ActiveRecord::Base
  belongs_to :newsarticle
  attr_accessible :tagname
end
