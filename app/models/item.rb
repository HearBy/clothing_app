class Item < ActiveRecord::Base
	belongs_to :model

	validates :thigh, :numericality => true 
	validates :knee, :numericality => true
	validates :leg_opening, :numericality => true
	validates :inseam, :numericality => true
	validates :tag_size, :numericality => true

	validates_numericality_of :waist, greater_than_or_equal_to: 26, less_than_or_equal_to: 42
	validates_numericality_of :front_rise, greater_than_or_equal_to: 8, less_than_or_equal_to: 13

	def self.price_search(min, max)
		if min && max 
			joins(:model).where('models.price >= ?', min).where('models.price <= ?', max)
		else
			all 
		end
	end

	def self.true_waist_search(waist_size)
		if waist_size	
			where('waist = ?', waist_size)
		else
			all
		end
	end

	def self.fit_search(search)
		if search
			joins(:model).where('models.fit = ?', search)
		else
			all
		end
	end

	# def self.waist_search(waist_size)
	# 	if !waist_size.blank?
	# 		where('waist <= ?', (waist_size.to_d + 0.25))
	# 		.where('waist >= ?', (waist_size.to_d - 0.5))
	# 	else
	# 		all
	# 	end
	# end

	# def self.front_rise_search(waist_size, front_rise)
	# 	if !waist_size.blank? && front_rise != 0
	# 		where("ABS(front_rise/waist - ?) < 0.03", front_rise)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.thigh_search(waist_size, thigh)
	# 	if !waist_size.blank? && thigh != 0
	# 		where("ABS(thigh/waist - ?) < 0.03", thigh)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.knee_search(waist_size, knee)
	# 	if !waist_size.blank? && knee != 0
	# 		where("ABS(knee/waist - ?) < 0.03", knee)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.leg_opening_search(waist_size, leg_opening)
	# 	if !waist_size.blank? && leg_opening != 0
	# 		where("ABS(leg_opening/waist - ?) < 0.03", leg_opening)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.made_in_search(made_in)
	# 	if !made_in.blank?
	# 		where('made_in = ?', made_in)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.fabric_origin_search(fabric_origin)
	# 	if !fabric_origin.blank?
	# 		where('fabric_origin = ?', fabric_origin)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.color_search(color)
	# 	if !color.blank?
	# 		where('color = ?', color)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.brand_search(brand)
	# 	if !brand.blank?
	# 		where('brand = ?', brand)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.price_search(min, max)
	# 	if !min.blank? && !max.blank?
	# 		where('price >= ?', min)
	# 		.where('price <= ?', max)
	# 	elsif !min.blank?
	# 		where('price >= ?', min)
	# 	elsif !max.blank?
	# 		where('price <= ?', max)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.denim_weight_search(min, max)
	# 	if !min.blank? && !max.blank?
	# 		where('denim_weight >= ?', min)
	# 		.where('denim_weight <= ?', max)
	# 	elsif !min.blank?
	# 		where('denim_weight >= ?', min)
	# 	elsif !max.blank?
	# 		where('denim_weight <= ?', max)
	# 	else
	# 		all
	# 	end	
	# end

	# def self.sanforized_search(sanforized)
	# 	case sanforized
	#     when "true"
	#       where('sanforized = ?', true)
	#     when "false"
	#       where('sanforized = ?', false)
	#     else
	#       all
	#     end
	# end

	# def self.selvedge_search(selvedge)
	# 	case selvedge
	#     when "true"
	#       where('selvedge = ?', true)
	#     when "false"
	#       where('selvedge = ?', false)
	#     else
	#       all
	#     end
	# end
end
