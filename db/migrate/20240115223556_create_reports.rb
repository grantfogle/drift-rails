class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :author
      t.text :body
      t.integer :rating
      t.references :flow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
