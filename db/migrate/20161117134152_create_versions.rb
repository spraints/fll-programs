class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.references :project
      t.references :parent_version
      t.references :committer
      t.string :comment

      t.timestamps
    end
  end
end
