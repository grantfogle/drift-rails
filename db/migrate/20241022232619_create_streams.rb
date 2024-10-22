class CreateStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :streams do |t|
      t.string :state
      t.string :usgs_id
      t.string :watershed
      t.string :watershed_id
      t.string :usgs_stream_name
      t.string :stream_name
      t.string :location

      t.timestamps
    end
  end
end
