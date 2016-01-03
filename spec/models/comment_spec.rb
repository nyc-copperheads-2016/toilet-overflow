require 'rails_helper'

RSpec.describe Comment, type: :model do
  before (:each) do
    @cq = FactoryGirl.create(:comment_question)
    @ca = FactoryGirl.create(:comment_answer)
  end
  it { should belong_to(:commentable) }
  it { should belong_to(:user) }
  it { should have_many(:votes) }
  it { should belong_to(:user) }
  it { should validate_presence_of :content }


  it 'responds to :content' do
    expect(@ca).to respond_to(:content)
    expect(@cq).to respond_to(:content)
  end

  it 'requires content more than lenth of 10 characters' do
    @ca.content = "abc"
    @cq.content = "def"
    expect(@ca.valid?).to eq false
    expect(@cq.valid?).to eq false
  end

end
