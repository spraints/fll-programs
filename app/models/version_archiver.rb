require "tempfile"

class VersionArchiver
  def initialize(version)
    @version = version
  end

  def create_archive
    archive = Tempfile.new("ev3hub")
    archive.close
    Zip::File.open(archive.path, Zip::File::CREATE) do |zf|
      @version.entries.each do |ve|
        zf.get_output_stream(ve.path) do |ze|
          ze.write(ve.file_content.content)
        end
      end
    end
    File.open(archive.path, "rb") do |f|
      f.read
    end
  ensure
    archive && archive.unlink
  end
end
