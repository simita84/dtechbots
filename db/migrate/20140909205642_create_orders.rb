class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :bk_name,      :null=>false
      t.integer :bk_qty ,     :null=>false
      t.string :order_status ,:default => "OPEN"

      t.timestamps
    end
  end
end
