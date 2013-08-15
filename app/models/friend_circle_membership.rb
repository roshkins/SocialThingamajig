class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :member_id, :admin

  belongs_to :member, :class_name => "User", :primary_key => :id,
             :foreign_key => :member_id

  belongs_to :friend_circle, :class_name => "FriendCircle", :primary_key => :id,
             :foreign_key => :circle_id
end
