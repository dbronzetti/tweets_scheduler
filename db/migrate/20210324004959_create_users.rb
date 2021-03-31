class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false # this will validates the presence of email when creating new user
      t.string :password_digest

      t.timestamps
    end
  end
end
