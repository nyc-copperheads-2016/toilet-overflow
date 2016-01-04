class CreateJoinTableQuestionTag < ActiveRecord::Migration
  def change
    create_join_table :questions, :tags do |t|
     t.integer :tag_id, { null: false, index: true }
     t.integer :question_id, { null: false, index: true }
     
     t.timestamps(null: false)
    end
  end
end
