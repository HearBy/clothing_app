class RemoveModelColumnsFromItems < ActiveRecord::Migration
  def change
  	remove_column :items, :name
  	remove_column :items, :brand
  	remove_column :items, :fabric_origin
  	remove_column :items, :made_in
  	remove_column :items, :price
  	remove_column :items, :denim_weight
  	remove_column :items, :color
  	remove_column :items, :link
  	remove_column :items, :sanforized
  	remove_column :items, :stretch
  	remove_column :items, :selvedge
  end
end
