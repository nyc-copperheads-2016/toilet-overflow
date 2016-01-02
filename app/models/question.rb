class Question < ActiveRecord::Base
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :question_title, :content, :user_id, presence: true
  validates :question_title, length: {minimum: 10}
  validates :question_title, length: {maximum: 128}

  validates :content, length: {minimum: 20}
end

