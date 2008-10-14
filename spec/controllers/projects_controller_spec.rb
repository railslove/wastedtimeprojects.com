require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do

  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all projects as @projects" do
      Project.should_receive(:paginate).with(:all,:page => nil).and_return([mock_project])
      get :index
      assigns[:projects].should == [mock_project]
    end

    describe "with mime type of xml" do
  
      it "should render all projects as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Project.should_receive(:paginate).with(:all, :page => nil).and_return(projects = mock("Array of Projects"))
        projects.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end
    
    describe "with mime type of js" do
  
      it "should render all projects as json" do
        request.env["HTTP_ACCEPT"] = 'application/json'
        Project.should_receive(:paginate).with(:all, :page => nil).and_return(projects = mock("Array of Projects"))
        projects.should_receive(:to_json).and_return("generated JSON")
        get :index, :format => "js"
        response.body.should == "generated JSON"
      end
    
      it "should wrap the projects json in a callback function" do
        request.env["HTTP_ACCEPT"] = 'application/json'
        Project.should_receive(:paginate).with(:all, :page => nil).and_return(projects = mock("Array of Projects"))
        projects.should_receive(:to_json).and_return("generated JSON")
        get :index, :callback => "callback", :format => "js"
        response.body.should == "callback(generated JSON)"
      end
    end

  end

  describe "responding to GET show" do

    it "should expose the requested project as @project" do
      Project.should_receive(:find_by_param!).with("37").and_return(mock_project)
      get :show, :id => "37"
      assigns[:project].should equal(mock_project)
    end
    
    describe "with mime type of xml" do

      it "should render the requested project as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Project.should_receive(:find_by_param!).with("37").and_return(mock_project)
        mock_project.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
    describe "with mime type of json" do

      it "should render the requested project as json" do
        request.env["HTTP_ACCEPT"] = "application/json"
        Project.should_receive(:find_by_param!).with("37").and_return(mock_project)
        mock_project.should_receive(:to_json).and_return("generated JSON")
        get :show, :id => "37", :format => "js"
        response.body.should == "generated JSON"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new project as @project" do
      Project.should_receive(:new).and_return(mock_project)
      get :new
      assigns[:project].should equal(mock_project)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested project as @project"

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created project as @project" do
        Project.should_receive(:new).with({'these' => 'params'}).and_return(mock_project(:save => true))
        post :create, :project => {:these => 'params'}
        assigns(:project).should equal(mock_project)
      end

      it "should redirect to the created project" do
        Project.stub!(:new).and_return(mock_project(:save => true))
        post :create, :project => {}
        response.should redirect_to(project_url(mock_project))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved project as @project" do
        Project.stub!(:new).with({'these' => 'params'}).and_return(mock_project(:save => false))
        post :create, :project => {:these => 'params'}
        assigns(:project).should equal(mock_project)
      end

      it "should re-render the 'new' template" do
        Project.stub!(:new).and_return(mock_project(:save => false))
        post :create, :project => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested project"

      it "should expose the requested project as @project"

      it "should redirect to the project"

    end
    
    describe "with invalid params" do

      it "should update the requested project"
      
      it "should expose the project as @project" 
      
      it "should re-render the 'edit' template" 

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested project" 
  
    it "should redirect to the projects list" 
    
    it "should redirect to index if the access_key is not valid"

  end

end
