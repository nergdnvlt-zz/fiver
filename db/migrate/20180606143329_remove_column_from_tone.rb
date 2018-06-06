class RemoveColumnFromTone < ActiveRecord::Migration[5.2]
  def change
    remove_column :tones, :url, :string
  end
end
