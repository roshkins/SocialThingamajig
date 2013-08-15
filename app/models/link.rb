class Link < ActiveRecord::Base
  attr_accessible :link_url, :post_id

  belongs_to :post, :class_name  => "Post", :primary_key  => :id,
        :foreign_key  => :post_id
end
