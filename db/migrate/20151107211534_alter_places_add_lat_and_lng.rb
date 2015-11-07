class AlterPlacesAddLatAndLng < ActiveRecord::Migration
  def change
  	add_column :stays, :latitude, :float
  	add_column :stays, :longitude, :float
  end
end
