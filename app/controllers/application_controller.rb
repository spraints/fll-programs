class ApplicationController < ActionController::Base
  include CurrentUser
  include ApplicationHelper
  protect_from_forgery with: :exception

  def load_slugged_owner_and_project
    @owner = User.where(:login => params.require(:owner)).first!
    @project = @owner.projects.where(:slug => params.require(:project)).first!
  end
end
