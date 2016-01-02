class Answer < ActiveRecord::Base
  # before_save :default_chosen_false
    
  has_and_belongs_to_many :editors, class_name: 'User'
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy

  validates :content, presence: true, length: { minimum: 10 }
  validates :chosen, inclusion: { in: [true, false] }

  def default_chosen_false
    self.chosen = false
  end
end
