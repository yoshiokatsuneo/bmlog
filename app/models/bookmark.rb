class Bookmark < ActiveRecord::Base
  attr_accessible :url, :tags_attributes
  has_many :tags
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
