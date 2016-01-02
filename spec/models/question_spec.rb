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
  it "should not allow questions without a title to be saved" do
    q = Question.new(question_title:"", content:'123412341234123412341234123412341234')
    q.save
    expect(q.id.nil?).to eq(true)
  end

  it "should not allow questions without content to be saved" do
    q = Question.new(question_title:"12341234123412341234", content:'123412341234')
    q.save
    expect(q.id.nil?).to eq(true)
  end


  it "should require that a Question title be at least 10 characters" do
    q = Question.new(question_title: "123456", content: '123412341234123412341234123412341234')
    q.save
    expect(q.id.nil?).to eq(true)
  end

  it "should require that its content be at least 20 characters" do
    q = Question.new(question_title: "123412341234123", content:"12345")
    q.save
    expect(q.id.nil?).to eq(true)
  end

  it "should belong to a user" do
    u1 = User.new(username: "bob", password_digest: "123456789", email: "bob@bob.com")
    u1.save
    q = u1.questions.new(question_title: "What is the best programming language to learn if you have no previous experience?", content: "I would appreciate any advice that people have to offer. Thanks!")
    expect(q.user_id).to eq(u1.id)
  end
end
