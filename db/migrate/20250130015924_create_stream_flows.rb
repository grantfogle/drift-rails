class CreateStreamFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :stream_flows do |t|
      t.references :stream, null:false, foreign_key: true
      t.integer :flow_rate, null:false
      t.datetime :measured_at, null:false

      t.timestamps
    end

    add_index :stream_flows, :measured_at
  end
end
