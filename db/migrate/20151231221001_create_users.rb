class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, { null: false, limit: 64 }
      t.string :password_digest, null: false 
      t.string :current_city, { limit: 64 }
      t.string :homepage_url, { limit: 100 }
      t.string :email, { null: false, limit: 64 }
      t.string :photo_url

      t.timestamps(null: false)
    end
  end
end
