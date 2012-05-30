class Bookmark < ActiveRecord::Base
  attr_accessible :url, :tags_attributes
  has_many :tags
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def self.search(search)
    if search && search != ""
      find(:all, :conditions => ["tags.name LIKE ?", "#{search}%"], :joins => :tags)
    else
      find(:all)
    end
  end
end
