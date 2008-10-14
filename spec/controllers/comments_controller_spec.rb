require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentsController do

  def mock_comment(stubs={})
    @mock_comment ||= mock_model(Comment, stubs)
  end
  
  describe "responding to POST create" do
    fixtures :projects
    
    describe "with valid params" do
      before(:each) do
        @valid_attributes = {
          "name" => "value for name",
          "body" => "value for body"
        }
        #@project = projects(:wastedtimeproject)
        @project = mock_model(Project)
        @comment = mock_model(Comment)
      end
      it "should expose a newly created comment as @comment" do
        @comment.should_receive(:save).and_return(true)
        Project.should_receive(:find_by_param!).and_return(@project)
        @project.should_receive(:comments).and_return(mock("comments", :build => @comment))
        
        post :create, :comment => @valid_attributes, :project_id => @project.id
        
        assigns(:comment).should eql(@comment)
      end

      it "should redirect to the parent project" do
        @comment.should_receive(:save).and_return(true)
        @project.should_receive(:comments).and_return(mock("comments", :build => @comment))
        Project.should_receive(:find_by_param!).and_return(@project)

        post :create, :comment => @valid_attributes, :project_id => @project.id
        response.should redirect_to(project_url(@project)+"#comment_#{@comment.id}")
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved comment as @comment" do
        @comment.should_receive(:save).and_return(false)
        @project.should_receive(:comments).and_return(mock("comments", :build => @comment))
        Project.should_receive(:find_by_param!).and_return(@project)
        
        post :create, :comment => {:these => 'params'}
        assigns(:comment).should equal(@comment)
        
      end

      it "should redirect to project_url and set a flash error" do
        @comment.should_receive(:save).and_return(false)
        @project.should_receive(:comments).and_return(mock("comments", :build => @comment))
        Project.should_receive(:find_by_param!).and_return(@project)
        post :create, :comment => {}
        response.should redirect_to(project_url(@project))
      end
      
    end
    
  end

end
