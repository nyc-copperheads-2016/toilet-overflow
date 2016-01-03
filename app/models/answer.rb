class Answer < ActiveRecord::Base
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :content, presence: true, length: { minimum: 10 }

  def points
    total = 0
    self.votes.each do |v|
      total += v.vote
    end
    total
  end

end
