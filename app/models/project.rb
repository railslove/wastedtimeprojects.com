class Project < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  
  validates_presence_of :name, :owner_name, :owner_email
  
  has_attached_file :preview, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  make_permalink :with => :name, :prepend_id => true
  
  before_create :insert_access_key
  after_create :notify_user
  
  attr_accessible :name, :description, :url, :location, :owner_name, :owner_url, :owner_email, :preview
  
  private 
    def insert_access_key
      self.access_key = Digest::SHA1.hexdigest("#{Time.now}--#{(1..10).map{ rand.to_s }}--#{name}")
    end
    
    def notify_user
      # TODO: implement user notification - 
    end
      
end
