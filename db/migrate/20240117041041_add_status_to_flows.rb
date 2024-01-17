class AddStatusToFlows < ActiveRecord::Migration[6.1]
  def change
    add_column :flows, :status, :string
  end
end
