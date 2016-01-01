class User < ActiveRecord::Base
  has_and_belongs_to_many :questions, foreign_key: :editor_id
  has_many :questions
end
