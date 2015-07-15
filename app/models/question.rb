class Question < ActiveRecord::Base
  validates :question1, :presence => true
  validates :question2, :presence => true
  validates :question1vote, :presence => true
  validates :question2vote, :presence => true


  def self.text_search(query)
    if query.present?
      where("question1 @@ :q or question2 @@ :q", q: query)
    end
  end
end
