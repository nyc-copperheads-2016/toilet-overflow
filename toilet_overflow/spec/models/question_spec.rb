require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:editors) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should have_and_belong_to_many(:tags) }
  it { should have_many(:answers) }
end
