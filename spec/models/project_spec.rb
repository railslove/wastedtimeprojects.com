require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :url => "value for url",
      :location => "value for location",
      :owner_name => "value for owner_name",
      :preview_file_name => "value for preview_file_name",
      :preview_content_type => "value for preview_content_type",
      :preview_file_size => "1",
      :preview_updated_at => Time.now,
      :access_key => "value for access_key"
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
  end
end
