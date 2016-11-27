class EntryDiff
  attr_accessor :new, :old
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def change_type
    if old.nil?
      "added"
    elsif new.nil?
      "deleted"
    elsif new.file_content_id == old.file_content_id
      "unchanged"
    else
      "modified"
    end
  end
end
