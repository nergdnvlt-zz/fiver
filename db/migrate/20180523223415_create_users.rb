class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'
    
    create_table :users do |t|
      t.string :name
      t.citext :username
      t.citext :email
      t.string :password_digest

      t.timestamps
    end
  end
end
