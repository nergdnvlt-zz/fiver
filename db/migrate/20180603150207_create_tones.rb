class CreateTones < ActiveRecord::Migration[5.2]
  def change
    create_table :tones do |t|
      t.string :tone_name
      t.string :url
    end
  end
end
