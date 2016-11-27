class VersionsController < ApplicationController
  def create
    load_slugged_owner_and_project
    VersionBuilder.new(@project).create_version(file: params[:ev3_file], current_user: current_user, comment: "todo")
    redirect_to @project
  end
end
