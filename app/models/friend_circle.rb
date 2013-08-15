class FriendCircle < ActiveRecord::Base
  attr_accessible :title

  has_many :friend_circle_memberships, :class_name => "FriendCircleMembership",
  :primary_key  => :id, :foreign_key  => :circle_id

  has_many :members, :through  => :friend_circle_memberships, :source  => :member

  has_many :shares, :class_name => "PostShare", :primary_key => :id,
  :foreign_key => :circle_id
end
