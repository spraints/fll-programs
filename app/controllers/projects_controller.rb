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
    @projects = Project.includes(:owner)
  end

  def show
    load_slugged_owner_and_project
    @versions = @project.versions.limit(10).includes(:committer)
    @versions_count = @project.versions.count
  end
end
