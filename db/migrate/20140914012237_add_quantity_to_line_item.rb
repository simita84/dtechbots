class AddQuantityToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :bk_qty, :integer
  end
end
