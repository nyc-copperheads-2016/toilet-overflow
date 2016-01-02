class Question < ActiveRecord::Base
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
