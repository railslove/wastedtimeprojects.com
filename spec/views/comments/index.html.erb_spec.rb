require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comments] = [
      stub_model(Comment,
        :name => "value for name",
        :email => "value for email",
        :body => "value for body"
      ),
      stub_model(Comment,
        :name => "value for name",
        :email => "value for email",
        :body => "value for body"
      )
    ]
  end

  it "should render list of comments" do
    render "/comments/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for email", 2)
    response.should have_tag("tr>td", "value for body", 2)
  end
end

