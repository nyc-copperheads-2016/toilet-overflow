class User < ActiveRecord::Base
  has_and_belongs_to_many :questions, foreign_key: :editor_id
  has_and_belongs_to_many :answers, foreign_key: :editor_id
  has_many :questions
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
