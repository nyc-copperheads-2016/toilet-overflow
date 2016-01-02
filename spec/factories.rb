FactoryGirl.define do
  factory :answer do
    content { Faker::Hipster.sentence }
    chosen { false }
    association :question
    association :user
  end
end
