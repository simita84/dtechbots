class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :inventory_id,:bk_qty
  belongs_to :inventory
  belongs_to :cart
end
