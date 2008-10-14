require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  before(:each) do
    @valid_attributes = {
      :project_id => "1",
      :name => "value for name",
      :body => "value for body"
    }
    @comment = Comment.new(@valid_attributes)
  end

  it "should be invalid without name" do
    Comment.should need(:name).using(@valid_attributes)    
  end
  
  it "should be invalid without a body" do
    Comment.should need(:body).using(@valid_attributes)
  end
  

  it "should have belong to project" do
    Comment.should belong_to(:project)
  end
end
