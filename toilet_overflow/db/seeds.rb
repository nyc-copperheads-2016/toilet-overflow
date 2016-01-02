u = User.create(username: "jay", password_digest: "hi", email: "jay@jay.com")

q = u.questions.create(question_title: "hi?", content: "hello")

q.comments.create(content: "first post", user_id: u.id)
