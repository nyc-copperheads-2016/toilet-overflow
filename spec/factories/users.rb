FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password_digest "password"
    current_city Faker::Address.city
    homepage_url Faker::Internet.url
    email Faker::Internet.email
    photo_url Faker::Avatar.image
  end
end