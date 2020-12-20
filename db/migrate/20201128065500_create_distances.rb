class CreateDistances < ActiveRecord::Migration[6.0]
  def change
    create_table :distances do |t|
      t.integer :sellinfo_id
      t.integer :buyinfo_id
      t.float :distance

      t.timestamps
    end
    add_index :distances, :sellinfo_id
    add_index :distances, :buyinfo_id
  end
end
