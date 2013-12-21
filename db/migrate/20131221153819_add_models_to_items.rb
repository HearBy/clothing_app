class AddModelsToItems < ActiveRecord::Migration
  def change
  	add_column :items, :model_id, :integer
  end
end
