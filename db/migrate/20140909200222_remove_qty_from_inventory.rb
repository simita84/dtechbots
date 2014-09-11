class RemoveQtyFromInventory < ActiveRecord::Migration
  def up
  	remove_column :inventories, :bk_qty
  end

  def down
  	add_column :inventories, :bk_qty
  end
end
