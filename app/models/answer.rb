class Answer < ActiveRecord::Base
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end