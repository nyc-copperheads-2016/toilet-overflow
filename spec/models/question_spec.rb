require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:user) }
  it { should have_and_belong_to_many(:editors) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
  it { should have_and_belong_to_many(:tags) }
  it { should have_many(:answers) }
end

describe Question do
  it "should require that a Question title be at least 10 characters" do
    q = Question.new(question_title: "123456", content: '123412341234123412341234123412341234')
    q.save
    expect ()
