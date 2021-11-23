class CreateBoats < ActiveRecord::Migration[6.1]
  def change
    create_table :boats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :boat_type
      t.string :location
      t.string :description
      t.string :title
      t.integer :price_per_day

      t.timestamps
    end
  end
end
