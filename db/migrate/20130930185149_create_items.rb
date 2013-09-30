class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.decimal :waist
      t.decimal :front_rise
      t.decimal :thigh
      t.decimal :knee
      t.decimal :leg_opening
      t.decimal :inseam
      t.decimal :denim_weight
      t.boolean :sanforized
      t.string :color
      t.string :price
      t.string :link

      t.timestamps
    end
  end
end
