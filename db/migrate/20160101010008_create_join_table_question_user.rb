class CreateJoinTableQuestionUser < ActiveRecord::Migration
  def change
    create_join_table :users, :questions do |t|
     t.integer :editor_id, { null: false, index: true }
     t.integer :question_id, { null: false, index: true }
     
     t.timestamps(null: false)
    end
  end
end
