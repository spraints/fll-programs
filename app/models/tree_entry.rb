class TreeEntry < ApplicationRecord
  belongs_to :version
  belongs_to :file_content
end
