class CreateTones < ActiveRecord::Migration[5.2]
  def change
    create_table :tones do |t|
      t.string :tone_name, index: true
      t.string :url
    end
  end
end
