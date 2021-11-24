class AddCoordinatesToBoat < ActiveRecord::Migration[6.1]
  def change
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
  end
end
