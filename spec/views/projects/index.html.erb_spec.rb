require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/index.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:projects] = [
      stub_model(Project,
        :name => "value for name",
        :description => "value for description",
        :url => "value for url",
        :location => "value for location",
        :owner_name => "value for owner_name",
        :preview_file_name => "value for preview_file_name",
        :preview_content_type => "value for preview_content_type",
        :preview_file_size => "1",
        :access_key => "value for access_key"
      ),
      stub_model(Project,
        :name => "value for name",
        :description => "value for description",
        :url => "value for url",
        :location => "value for location",
        :owner_name => "value for owner_name",
        :preview_file_name => "value for preview_file_name",
        :preview_content_type => "value for preview_content_type",
        :preview_file_size => "1",
        :access_key => "value for access_key"
      )
    ]
  end

  it "should render list of projects" do
    render "/projects/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", "value for url", 2)
    response.should have_tag("tr>td", "value for location", 2)
    response.should have_tag("tr>td", "value for owner_name", 2)
    response.should have_tag("tr>td", "value for preview_file_name", 2)
    response.should have_tag("tr>td", "value for preview_content_type", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "value for access_key", 2)
  end
end

