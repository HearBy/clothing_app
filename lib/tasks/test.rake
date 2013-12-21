namespace :db do
  desc "Fill database with jeans"
  task test_populate: :environment do
    make_items
  end
end

def make_items
	#1 3sixteen SL-100x
	Model.create!(name: "SL-100x",
				   brand: "3sixteen",
				   fabric_origin: "Kuroki Mills",
				   made_in: "USA",
				   price: 215.00,
				   denim_weight: 14.5,
				   color: "Indigo",
				   fit: "Slim Straight",
				   sanforized: true,
				   stretch: false,
				   selvedge: true,
				   url: "http://www.selfedge.com/shop/index.php?main_page=product_info&cPath=82&products_id=438",)


	#1 3sixteen SL-100x
	Item.create!(waist: 31,
				   front_rise: 10.8,
				   thigh: 11.2,
				   knee: 8.3,
				   leg_opening: 7.7,
				   inseam: 37,
				   tag_size: 30,
				   model_id:1,)

	#1 3sixteen SL-100x
	Item.create!(waist: 32,
				   front_rise: 11,
				   thigh: 11.3,
				   knee: 8.4,
				   leg_opening: 7.8,
				   inseam: 37,
				   tag_size: 31,
				   model_id:1,)

	#1 3sixteen SL-100x
	Item.create!(waist: 33,
				   front_rise: 11.1,
				   thigh: 11.7,
				   knee: 8.7,
				   leg_opening: 7.9,
				   inseam: 37,
				   tag_size: 32,
				   model_id:1,)
end