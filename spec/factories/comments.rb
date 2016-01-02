FactoryGirl.define do
  # in order to create a comment, we need content, a user associated with the comment, and the type of thing the comment is associated with. in this case question, or answer. we need to build the associated question or answer to attach this factory generated comment to it
  factory :comment_for_question do
    content Faker::Hacker.say_something_smart
    association :user
    association :commentable, factory: :question
    # not sure on this line as for how we will use it in our rspec
    commentable_type  "Question"
  end
  factory :comment_for_answer do
    content Faker::Hacker.say_something_smart
    association :user
    association :commentable, factory: :answer
    # not sure on this line as for how we will use it in our rspec
    commentable_type  "Answer"
  end
end