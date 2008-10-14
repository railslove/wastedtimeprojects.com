require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  before(:each) do
    @valid_attributes = {
      :name => "Wasted time project",
      :description => "A project I've done",
      :url => "http://wastedtimeproject.com",
      :location => "Cologne, Germany",
      :owner_name => "Michael",
      :owner_email => "michael@railslove.com"
    }
    @project = Project.new(@valid_attributes)
  end


  it "should be invalid without name" do
    Project.should need(:name).using(@valid_attributes)
  end
  
  it "should be invalid without owner email" do
    Project.should need(:owner_email).using(@valid_attributes)    
  end
  
  it "should be invalid without owner name" do
    Project.should need(:owner_name).using(@valid_attributes)
  end
  

  it "should have many comments" do
    Project.should have_many(:comments).with_options({:extend=>[], :dependent=>:destroy})
  end
  
  it "should insert access key before create" do
    @project.access_key.should be_blank
    @project.save.should eql(true)
    key = @project.access_key
    @project.reload.access_key.should eql(key)
  end
  
  it "should have a nice url that includes the name" do
    @project.save
    @project.to_param.include?("wasted-time-project").should eql(true)
  end
  
  it "should not change access_key on mass-assignment" do
    @project.attributes = {:access_key => "key"}
    @project.access_key.should be_blank
  end
end
