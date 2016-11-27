module ApplicationHelper
  def project_path(project = @project)
    project_url(project, only_path: true)
  end

  def project_url(project = @project, options = {})
    if project.is_a?(Hash)
      project, options = @project, project
    end
    url_for options.merge({
      controller: "projects",
      action: "show",
      owner: project.owner,
      project: project,
    })
  end

  def project_upload_path(project = @project)
    project_upload_url(project, only_path: true)
  end

  def project_upload_url(project = @project, options = {})
    project_url(project, options) + "/versions"
  end

  def version_path(version)
    project_url(version.project, only_path: true) + "/versions/#{version.to_param}"
  end

  def time_ago_tag(time)
    time_tag(time, time_ago_in_words(time) + " ago", title: time.to_s)
  end
end
