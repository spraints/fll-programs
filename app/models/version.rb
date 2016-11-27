class Version < ApplicationRecord
  belongs_to :project
  belongs_to :parent_version, class_name: "Version", required: false
  belongs_to :committer, class_name: "User"
  has_many :entries, class_name: "TreeEntry"

  default_scope { order("created_at DESC") }
end
