class AddAdminToFriendCircleMembership < ActiveRecord::Migration
  def change
    add_column :friend_circle_memberships, :admin, :boolean
  end
end
