class Inventory < ActiveRecord::Base
  attr_accessible :bk_name, :bk_price, :bk_qty



  validates :bk_name, presence: true  
  validates :bk_price, presence: true
  validates :bk_qty, presence: true

end
