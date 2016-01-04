class Question < ActiveRecord::Base
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :question_title, :content, :user_id, presence: true
  validates :question_title, length: {minimum: 10}
  validates :question_title, length: {maximum: 128}

  validates :content, length: {minimum: 20}
end

