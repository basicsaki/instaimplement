class CreateModels < ActiveRecord::Migration
  def change
    create_table :instagram_users do |t|
      t.string :full_name
      t.string :insta_id
      t.string :username
      t.text :profile_picture_link
      t.text :bio
      t.text :website
      t.text :access_token
      t.text :access_token_updated_at

      t.timestamps null: false
    end
    
  end
end