class Order < ActiveRecord::Base
  attr_accessible :bk_name, :bk_qty, :order_status
end
