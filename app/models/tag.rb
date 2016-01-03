require 'attribute_normalizer'

class Tag < ActiveRecord::Base
  normalize_attribute :name
  #before_save :to_downcase
  #before_save :replace_with_dashes
  has_and_belongs_to_many :questions
  validates :name, uniqueness: true

  def to_downcase
    self.name = self.name.downcase
  end

  def replace_with_dashes
    self.name = self.name.parameterize
  end
end
