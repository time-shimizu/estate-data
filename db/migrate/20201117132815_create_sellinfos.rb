class CreateSellinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sellinfos do |t|
      t.string :address
      t.integer :price
      t.float :area
      t.float :lat
      t.float :lng
      t.string :yield
      t.string :name
      t.string :meeting

      t.timestamps
    end
  end
end
