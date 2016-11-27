class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project].permit(:name))
    if @project.save
      redirect_to @project
    else
      render "new"
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @owner = User.where(:login => params.require(:owner)).first!
    @project = @owner.projects.where(:slug => params.require(:project)).first!
    @versions = @project.versions.order("created_at DESC").limit(10)
    @versions_count = @project.versions.count
  end
end
