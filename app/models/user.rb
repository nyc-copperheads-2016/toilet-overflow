class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :questions, foreign_key: :editor_id
  has_and_belongs_to_many :answers, foreign_key: :editor_id
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :username, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :password, length: { minimum: 8 }



end
