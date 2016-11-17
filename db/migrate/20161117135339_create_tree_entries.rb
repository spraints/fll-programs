class CreateTreeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :tree_entries do |t|
      t.references :version
      t.references :file_content
      t.string :path

      t.timestamps
    end
    add_index :tree_entries, [:version_id, :path], unique: true
  end
end
