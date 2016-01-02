class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, { null: false, index: true }
      t.integer :user_id, { null: false, index: true }
      
      t.boolean :chosen, { default: false }
      t.string :content, null: false
      
      t.timestamps(null: false)
    end
  end
end
