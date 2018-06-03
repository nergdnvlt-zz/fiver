class CreateTweetTones < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_tones do |t|
      t.references :tweet, foreign_key: true
      t.references :tone, foreign_key: true
    end
  end
end
