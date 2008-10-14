class Comment < ActiveRecord::Base
  belongs_to :project
  
  validates_presence_of :name, :body
  
  attr_accessible :name, :url, :body
end
