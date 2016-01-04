u = User.create(username: "jay", password_digest: "hi", email: "jay@jay.com")

# q = u.questions.create(question_title: "hi?", content: "hello")

10.times do
  u = FactoryGirl.create(:user)

  4.times do
    q = FactoryGirl.create(:question, user_id: u.id)

    3.times do
      q.tags.create(name: Faker::Lorem.characters(5))
    end

    4.times do
      a = q.answers.create(content: Faker::Hipster.paragraph, user_id: User.last.id)
      3.times do
        a.comments.create(content: Faker::Hipster.sentences(1).join(" "), user_id: User.last.id)
      end
    end

    2.times do
      q.comments.create(content: Faker::Hacker.say_something_smart, user_id: User.last.id)
    end

  end
end
