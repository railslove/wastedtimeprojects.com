require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/show.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
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
  end

  it "should render attributes in <p>" do
    render "/projects/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ url/)
    response.should have_text(/value\ for\ location/)
    response.should have_text(/value\ for\ owner_name/)
    response.should have_text(/value\ for\ preview_file_name/)
    response.should have_text(/value\ for\ preview_content_type/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ access_key/)
  end
end

