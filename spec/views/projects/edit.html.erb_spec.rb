require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/edit.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :new_record? => false,
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

  it "should render edit form" do
    render "/projects/edit.html.erb"
    
    response.should have_tag("form[action=#{project_path(@project)}][method=post]") do
      with_tag('input#project_name[name=?]', "project[name]")
      with_tag('textarea#project_description[name=?]', "project[description]")
      with_tag('input#project_url[name=?]', "project[url]")
      with_tag('input#project_location[name=?]', "project[location]")
      with_tag('input#project_owner_name[name=?]', "project[owner_name]")
      with_tag('input#project_preview_file_name[name=?]', "project[preview_file_name]")
      with_tag('input#project_preview_content_type[name=?]', "project[preview_content_type]")
      with_tag('input#project_preview_file_size[name=?]', "project[preview_file_size]")
      with_tag('input#project_access_key[name=?]', "project[access_key]")
    end
  end
end


