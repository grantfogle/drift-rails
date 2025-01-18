class CreateFavoriteStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_streams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stream, null: false, foreign_key: true

      t.timestamps
    end
    
    # Ensure a user can't favorite the same stream twice
    add_index :favorite_streams, [:user_id, :stream_id], unique: true
  end
end
