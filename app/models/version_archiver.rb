class VersionArchiver
  def initialize(version)
    @version = version
  end

  def create_archive
    io = StringIO.new "".encode("BINARY")
    zf = Zip::File.new(io, true, true)
    @version.entries.each do |ve|
      zf.get_output_stream(ve.path) do |ze|
        ze.write(ve.file_content.content)
      end
    end
    zf.write_buffer(io)
    io.string
  end
end
