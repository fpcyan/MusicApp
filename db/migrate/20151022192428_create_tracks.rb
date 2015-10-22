class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :track_type, null: false
      t.text :lyrics
      t.integer :album_id, null: false, index: true

      t.timestamps
    end
    change_table :albums do |t|
      t.string :rtype, null: false
    end
  end
end
