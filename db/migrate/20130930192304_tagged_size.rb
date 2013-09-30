class TaggedSize < ActiveRecord::Migration
  def change
  	add_column :items, :tag_size, :integer
  end
end
