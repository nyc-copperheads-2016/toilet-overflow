class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote, { null: false }
      t.integer :user_id, { null: false, index: true }
      t.integer :voteable_id, { null: false, index: true }
      t.string :voteable_type, { null: false, index: true }

      t.timestamps(null: false)
    end
  end
end
