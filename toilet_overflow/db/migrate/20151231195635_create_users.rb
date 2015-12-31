class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, { null: false }
      t.string :password_digest, { null: false }
      t.string :city_of_residence
      t.string :homepage_url
    end
  end
end
