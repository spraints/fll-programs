class VersionsController < ApplicationController
  before_filter :load_slugged_owner_and_project

  def create
    redirect_to VersionBuilder.new(@project).create_version(file: params[:ev3_file], current_user: current_user, comment: params[:comment])
  end

  def show
    @version = @project.versions.find(params[:id])
    respond_to do |format|
      format.zip do
        zip_data = VersionArchiver.new(@version).create_archive
        send_data zip_data, type: "application/zip", filename: "#{@project.name}.ev3"
      end
      format.html do
        entries = Hash.new { |h,k| h[k] = EntryDiff.new(k) }
        @version.entries.each do |e|
          entries[e.path].new = e
        end
        if @parent = @version.parent_version
          @parent.entries.each do |e|
            entries[e.path].old = e
          end
        end
        @entries = entries.values
      end
    end
  end
end
