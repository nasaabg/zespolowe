class Post < ActiveRecord::Base
  belongs_to :post_type
  belongs_to :parent
  belongs_to :user
end