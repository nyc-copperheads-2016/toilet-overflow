require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_and_belong_to_many(:questions) }
  it { should validate_uniqueness_of(:name)}
end
