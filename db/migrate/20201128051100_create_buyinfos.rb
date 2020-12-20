class CreateBuyinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyinfos do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :lowest_price
      t.integer :highest_price
      t.float :lowest_area
      t.float :highest_area
      t.integer :kind, null: false, default: 0
      t.string :name
      t.string :meeting
      t.string :memo

      t.timestamps
    end
  end
end
