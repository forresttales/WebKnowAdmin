class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|

      t.string "name_first", :limit => 255
      t.string "name_last", :limit => 255
      t.string "username", :limit => 255
      t.string "email", :limit => 255
      t.string "password", :limit => 255

      t.string "password_digest"
      t.string "remember_token"
      t.string "hashed_password"
      t.string "salt"

      t.timestamps
    end
  end
end
