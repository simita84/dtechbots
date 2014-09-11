class AddAuthorToInventory < ActiveRecord::Migration
  def change

  	add_column :inventories ,:bk_author ,:string ,null: false, limit: 50

  end
end
