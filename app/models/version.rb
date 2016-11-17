class Version < ApplicationRecord
  belongs_to :project
  belongs_to :parent_version, class_name: "Version"
  belongs_to :committer, class_name: "User"
end
