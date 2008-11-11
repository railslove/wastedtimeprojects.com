class ProjectsController < ResourceController::Base
  
  def index
    @projects = Project.paginate(:all, :page => params[:page], :order => "projects.created_at DESC")
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @projects }
      format.js { render :json => @projects, :callback => params[:callback]}
    end
  end
  
  def show
    @project = Project.find_by_param!(params[:id])
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @project }
      format.js { render :json => @project, :callback => params[:callback]}
    end
  end
  
  def new
    @project = Project.new(params[:project])
  end
  
  def create
    @project = Project.new(params[:project])
    
    respond_to do |format|
      if @project.save
        format.html { 
          flash[:ok] = "Great, thanks for your entry!"
          redirect_to project_url(@project)
        }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
        format.js { render :json => @project, :callback => params[:callback] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
        format.js { render :json => @project.errors, :callback => params[:callback] }
      end
    end
  end
  
  def edit
    @project = Project.find_by_access_key(params[:access_key])
    raise ActiveRecord::RecordNotFound unless @project
  end
  
  def update
    @project = Project.find_by_access_key(params[:access_key])
    raise ActiveRecord::RecordNotFound unless @project
        
    respond_to do |format|
       if @project.update_attributes(params[:project])
         format.html { 
           flash[:ok] = "Great, thanks for your entry!"
           redirect_to project_url(@project)
         }
         format.xml  { render :xml => @project, :status => :created, :location => @project }
         format.js { render :json => @project, :callback => params[:callback] }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
         format.js { render :json => @project.errors, :callback => params[:callback] }
       end
     end
  end
  
  def destroy
    @project = Project.find_by_access_key(params[:access_key])
    raise ActiveRecord::RecordNotFound unless @project
    @project.destroy
    flash[:notice] = "Project got deleted"
    redirect_to project_url(@project)
  end
end
