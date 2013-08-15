class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :links_attributes

  validates :title, :body, :user_id, :presence  => true

  belongs_to :author, :class_name => "User", :primary_key => :id,
             :foreign_key => :user_id

  has_many :links, :class_name  => "Link", :primary_key  => :id,
           :foreign_key  => :post_id

  accepts_nested_attributes_for :links, :reject_if => :all_blank

  has_many :shares, :class_name => "PostShare", :primary_key => :id,
           :foreign_key => :post_id
end
