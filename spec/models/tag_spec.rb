require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_and_belong_to_many(:questions) }
  it { should validate_uniqueness_of(:name)}
  it { expect(:name).to be(:name.downcase)}
end

describe Tag do
  it "should not allow tags to be created without a name." do
    t = Tag.new(:name => "")
    expect(t.id.nil?).to eq(true)
  end

  it "should have a downcased name after save" do
    t = Tag.new(:name => "AKB48")
    t.save
    expect(t.name).to eq(t.name.downcase)
  end

  it "should be parameterized after save" do
    t = Tag.new(:name => "hello world")
    t.save
    expect(t.name).to eq(t.replace_with_dashes)
  end
end