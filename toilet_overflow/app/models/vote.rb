class Comment < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
end
