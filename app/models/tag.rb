class Tag < ActiveRecord::Base
  belongs_to :bookmark
  attr_accessible :name
end
