class AddKindToSellinfos < ActiveRecord::Migration[6.0]
  def change
    add_column :sellinfos, :kind, :integer, null: false, default: 0
  end
end
