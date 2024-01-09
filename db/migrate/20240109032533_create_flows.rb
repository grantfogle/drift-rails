class CreateFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :flows do |t|
      t.text :name
      t.text :location
      t.integer :flow

      t.timestamps
    end
  end
end
