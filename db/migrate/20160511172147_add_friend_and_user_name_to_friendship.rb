class AddFriendAndUserNameToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :friend_name, :string
    add_column :friendships, :user_name, :string
  end
end
