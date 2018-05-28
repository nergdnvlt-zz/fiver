class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :text
      t.string :score
      t.string :tone_id
      t.string :tone_name

      t.timestamps
    end
  end
end
