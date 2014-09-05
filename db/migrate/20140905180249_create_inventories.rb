class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :bk_name,null: false
      t.integer :bk_qty,null: false
      t.decimal :bk_price,null: false

      t.timestamps
    end
  end
end
