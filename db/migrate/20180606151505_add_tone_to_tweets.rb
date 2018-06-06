class AddToneToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :tone, foreign_key: true
  end
end
