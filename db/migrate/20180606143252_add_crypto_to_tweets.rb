class AddCryptoToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :crypto, foreign_key: true
  end
end
