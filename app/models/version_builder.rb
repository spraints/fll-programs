class VersionBuilder
  def initialize(project)
    @project = project
  end

  def create_version(file:, current_user:, comment:)
    ActiveRecord::Base.transaction do
      version = @project.versions.create! \
        committer: current_user,
        comment: comment,
        parent_version: @project.versions.first

      open_zip(file) do |zf|
        zf.each do |entry|
          save_entry version, entry
        end
      end

      version
    end
  end

  def save_entry(version, entry)
    data = nil
    entry.get_input_stream do |io|
      data = io.read
    end
    #raise "Unexpected encoding: #{data.encoding} from #{entry.inspect}" unless data.encoding == Encoding::BINARY

    content = FileContent.where(:sha1 => Digest::SHA1.hexdigest(data)).first_or_initialize
    if content.new_record?
      content.content = data
      content.save!
    end

    version.entries.create! \
      version: version,
      file_content: content,
      path: entry.name
  end

  def open_zip(filish)
    if filish.is_a?(String)
      Zip::File.open(filish) { |zf| yield zf }
    elsif filish.respond_to?(:tempfile)
      Zip::File.open(filish.tempfile.path) { |zf| yield zf }
    else
      Zip::File.open_buffer(filish) { |zf| yield zf }
    end
  end
end
