class CreateJoinTableAnswerUser < ActiveRecord::Migration
  def change
    create_join_table :users, :answers do |t|
      t.integer :editor_id, { null: false, index: true }
      t.integer :answer_id, { null: false, index: true }

      t.timestamps(null: false)
    end
  end
end
