class RemoveColumnsFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :score, :string
    remove_column :tweets, :tone_id, :string
    remove_column :tweets, :tone_name, :string
  end
end
