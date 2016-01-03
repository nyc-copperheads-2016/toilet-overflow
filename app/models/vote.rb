class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user
  validates :user_id, :uniqueness => {:scope => [:voteable_id, :voteable_type]}
  validates :vote, :inclusion => {:in => [-1,1]}
end
