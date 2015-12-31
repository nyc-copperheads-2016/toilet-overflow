class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_title, null: false
      t.string :content, null: false
      t.integer :editor_id
      t.integer :author_id, null: false

      t.timestamps null: false
    end
  end
end
