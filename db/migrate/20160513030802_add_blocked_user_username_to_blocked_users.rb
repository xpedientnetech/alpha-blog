class AddBlockedUserUsernameToBlockedUsers < ActiveRecord::Migration
  def change
    add_column :blocked_users, :blocked_username, :string
  end
end
