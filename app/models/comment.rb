class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

  validates :content, presence: true, length: {minimum: 10}
  validates :user_id, presence: true
end
