class AddMemberUsernameAsIndexToCartsTable < ActiveRecord::Migration
  def change

  	add_index("carts","member_username")
  end
end
