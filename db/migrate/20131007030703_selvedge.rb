class Selvedge < ActiveRecord::Migration
  def change
  	add_column :items, :selvedge, :boolean
  end
end
