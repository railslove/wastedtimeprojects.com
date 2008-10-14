class CommentsController < ResourceController::Base

  def create
    @project = Project.find_by_param!(params[:project_id])
    @comment = @project.comments.build(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.html { 
          flash[:ok] = "Great, thanks for your comment!"
          redirect_to "#{project_url(@project)}#comment_#{@comment.id}"
        }
        format.xml  { render :xml => @comment, :status => :created, :location => @project }
        format.js { render :json => @comment, :callback => params[:callback] }
      else
        format.html { 
          flash[:error] = "Damn, something went wrong..."
          redirect_to project_url(@project)
        }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        format.js { render :json => @comment.errors, :callback => params[:callback] }
      end
    end
  end
end
