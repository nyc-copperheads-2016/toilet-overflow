class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, { null: false, unique: true, limit: 64 }
      
      t.timestamps(null: false)
    end
  end
end
