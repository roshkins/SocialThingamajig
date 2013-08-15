class PostShares < ActiveRecord::Base
  attr_accessible :circle_id, :user_id

  belongs_to :post, :class_name  => "Post", :primary_key  => :id,
  :foreign_key  => :post_id

  belongs_to :circle, :class_name  => "FriendCircle", :primary_key  => :id,
  :foreign_key => :circle_id
end
