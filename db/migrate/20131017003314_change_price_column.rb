class ChangePriceColumn < ActiveRecord::Migration
  def change
  	change_column :items, :price, 'decimal USING CAST(price AS decimal)', :precision => 8, :scale => 2
  end
end
