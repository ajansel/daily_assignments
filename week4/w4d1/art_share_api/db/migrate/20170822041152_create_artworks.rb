class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :artworks, :title, null:false
      t.string :artworks, :image_url, null:false
      t.integer :artworks, :artist_id, null:false
      t.timestamps
    end

    add_index :artworks, :title, unique: true
  end
end
