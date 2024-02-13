class AddStreamUsgsAndStateToFlow < ActiveRecord::Migration[6.1]
  def change
    add_column :flows, :stream, :string
    add_column :flows, :usgs_id, :integer
    add_column :flows, :state, :string
  end
end
