class AnswerPoint < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer, :dependent => :destroy
end
