class CreateFileContents < ActiveRecord::Migration[5.0]
  def change
    create_table :file_contents do |t|
      t.string :sha1, limit: 40
      t.binary :content

      t.timestamps
    end
    add_index :file_contents, :sha1, unique: true
  end
end
