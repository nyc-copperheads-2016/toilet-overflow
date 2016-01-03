require 'attribute_normalizer'

class Tag < ActiveRecord::Base
  normalize_attribute :name
  before_save :to_downcase
  has_and_belongs_to_many :questions
  validates :name, uniqueness: true

  def to_downcase
    self.name = self.name.downcase
  end

end
