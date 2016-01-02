require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  it { should have_and_belong_to_many(:editors) }
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }

  before(:each) do
  end
end
