class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :owner
      t.string :name

      t.timestamps
    end
    add_index :projects, [:owner_id, :name], unique: true
  end
end
