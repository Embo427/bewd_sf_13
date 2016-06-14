class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.text :bio
      t.string :image
      t.boolean :active

      t.timestamps
    end
  end
end
