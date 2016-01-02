FactoryGirl.define do
  factory :answer do
    association :question
    association :user
    # does not need chosen as it defaults to false and model behavior will change to true
    content Faker::Hipster.paragraph
  end
end