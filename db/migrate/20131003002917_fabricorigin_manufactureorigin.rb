class FabricoriginManufactureorigin < ActiveRecord::Migration
  def change
  	add_column :items, :fabric_origin, :string
  	add_column :items, :made_in, :string
  end
end
