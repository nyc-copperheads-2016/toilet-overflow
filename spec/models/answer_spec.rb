require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  it { should have_and_belong_to_many(:editors) }
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }

  before(:each) do
    @answer = FactoryGirl.create(:answer)
  end

  it 'requires content to be longer than 10 characters' do
    @answer.content = "abc"
    expect(@answer.valid?).to eq false
  end

  it 'requires content to be longer than 10 characters' do
    @answer.content = "123456789012334555"
    expect(@answer.valid?).to eq true
  end

  it 'displays the points of the answer when answer#points is called' do
    10.times do
      @answer.votes << FactoryGirl.create(:answer_vote, voteable: @answer)
    end
    expect(@answer.points > -11).to be true
    expect(@answer.points < 11).to be true
  end
end
