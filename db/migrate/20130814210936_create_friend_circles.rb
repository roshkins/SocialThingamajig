class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :friender_id, :null  => false
      t.integer :friendee_id, :null  => false

      t.timestamps
    end
  end
end
