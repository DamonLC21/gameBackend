class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image_url
      t.integer :likes

      t.timestamps
    end
  end
end
