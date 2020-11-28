class CreateBuyinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :buyinfos do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :price
      t.float :area
      t.integer :kind
      t.string :name
      t.string :string
      t.string :meeting
      t.string :memo

      t.timestamps
    end
  end
end
