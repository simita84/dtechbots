class AddMemberUserNameToCarts < ActiveRecord::Migration
  def change
  	add_column("carts","member_username",:string,:null=>false)
  end
end
