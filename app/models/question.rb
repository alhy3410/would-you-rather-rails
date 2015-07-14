class Question < ActiveRecord::Base
  validates :question1, :presence => true
  validates :question2, :presence => true
  validates :question1vote, :presence => true
  validates :question2vote, :presence => true

end
