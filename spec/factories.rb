FactoryGirl.define do
  # in order to create a comment, we need content, a user associated with the comment, and the type of thing the comment is associated with. in this case question, or answer. we need to build the associated question or answer to attach this factory generated comment to it
  factory :user do
    username {Faker::Internet.user_name + Faker::Internet.user_name}
    password 'password'
    current_city {Faker::Address.city}
    homepage_url {Faker::Internet.url}
    email {Faker::Internet.email}
    photo_url {Faker::Avatar.image}
  end

  factory :question do
    question_title {Faker::Hipster.sentence}
    content {Faker::Hipster.paragraph}
    association :user
  end

  factory :answer do
    association :question
    association :user
    # does not need chosen as it defaults to false and model behavior will change to true
    chosen {false}
    content {Faker::Hipster.paragraph}
  end

  factory :comment_question, class: "Comment" do
    content {Faker::Hacker.say_something_smart}
    association :commentable, factory: :question
    association :user
    # not sure on this line as for how we will use it in our rspec
    commentable_type  {"Question"}
  end

  factory :comment_answer, class: "Comment" do
    content {Faker::Hacker.say_something_smart}
    association :user
    association :commentable, factory: :answer
    # not sure on this line as for how we will use it in our rspec
    commentable_type  {"Answer"}
  end

  factory :answer_vote, class: "Vote" do
    vote {[-1, 1].sample}
    association :user
    association :voteable, factory: :answer
    voteable_type {"Answer"}
  end

  factory :comment_vote, class: "Vote" do
    vote {[-1, 1].sample}
    association :user
    association :voteable, factory: :comment
    voteable_type {"Comment"}
  end

  factory :question_vote, class: "Vote" do
    vote {[-1, 1].sample}
    association :user
    association :voteable, factory: :Question
    voteable_type {"Question"}
  end
end
