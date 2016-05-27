class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  acts_as_taggable
end
