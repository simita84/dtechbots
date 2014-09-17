class Inventory < ActiveRecord::Base
  attr_accessible :bk_name, :bk_price,:bk_author

  default_scope :order => 'created_at'

  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
#

  validates :bk_name, presence: true  
  validates :bk_price, presence: true

# ensure that there are no line items referencing this book in the inventory
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "Line Items present"
			return false
		end
	end

end

 