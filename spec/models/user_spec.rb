require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions) }
  it { should have_and_belong_to_many(:questions).with_foreign_key('editor_id') }
  it { should have_many(:answers) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }
end