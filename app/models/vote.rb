class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :vote_type
  belongs_to :user
end
