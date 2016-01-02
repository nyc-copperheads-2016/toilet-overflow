# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    question_title Faker::Book.title
    content Faker::Hipster.paragraph
    association :user
  end
end
