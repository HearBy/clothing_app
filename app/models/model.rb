class Model < ActiveRecord::Base
	has_many :items

	validates :name, presence: true
	validates :brand, presence: true
	validates :fabric_origin, presence: true
	validates :made_in, presence: true
	validates :price, presence: true
	validates :denim_weight, presence: true
	validates :color, presence: true
	validates :fit, presence: true, :inclusion => { :in => ["straight", "slim straight", "skinny", "tapered"] }
	validates :url, presence: true

	validates_numericality_of :price, greater_than_or_equal_to: 20, less_than_or_equal_to: 1000

	# def self.price_search(min, max)
	# 	if min && max
	# 		where('price >= ?', min)
	# 		.where('price <= ?', max)
	# 	else
	# 		all
	# 	end
	# end

	# def self.fit_search(search)
	# 	if search
	# 		where('fit = ?', search)
	# 	else
	# 		all
	# 	end
	# end
end
