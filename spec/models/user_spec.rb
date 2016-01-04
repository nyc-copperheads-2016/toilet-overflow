require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:questions) }
  it { should have_and_belong_to_many(:questions).with_foreign_key('editor_id') }
  it { should have_many(:answers) }
  it { should have_many(:comments) }
  it { should have_many(:votes) }

  it 'tests whether has_secure_password is present' do
    use = FactoryGirl.create(:user)
    expect(use.id.nil?).to eq false
  end

  it 'tests whether has_secure_password is present, rejects long password' do
    use = FactoryGirl.build(:user, password: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
    use.save
    expect(use.id).to eq nil
  end

  it 'password should be at least 8 characters long' do
    use = FactoryGirl.build(:user, password: "123")
    use.save
    expect(use.id).to eq nil
  end

  it 'username has a minimum length of 4' do
    use = FactoryGirl.build(:user, username: "123")
    use.save
    expect(use.id).to eq nil
  end

  it 'username has a minimum length of 4' do
    use = FactoryGirl.build(:user, username: "12345")
    use.save
    expect(use.id.nil?).to eq false
  end

  it 'email is properly formatted' do
    use = FactoryGirl.build(:user, email: "jay@@.com")
    use.save
    expect(use.id).to eq nil
  end

  it 'username must be unique' do
    use1 = FactoryGirl.create(:user, username: "arcarcarc")
    use2 = FactoryGirl.build(:user, username: "arcarcarc")
    use2.save
    expect(use2.id).to eq nil
  end

  it 'email must be unique' do
    use1 = FactoryGirl.create(:user, email: "dbc@dbc.com")
    use2 = FactoryGirl.build(:user, email: "dbc@dbc.com")
    use2.save
    expect(use2.id).to eq nil
  end
    
end
