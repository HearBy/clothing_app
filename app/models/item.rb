class Item < ActiveRecord::Base
	def self.waist_search(waist_size)
		if !waist_size.blank?
			where('waist <= ?', (waist_size.to_d + 0.25))
			.where('waist >= ?', (waist_size.to_d - 0.5))
		else
			all
		end
	end

	def self.front_rise_search(waist_size, front_rise)
		if !waist_size.blank? && front_rise != 0
			where("ABS(front_rise/waist - ?) < 0.03", front_rise)
		else
			all
		end	
	end

	def self.thigh_search(waist_size, thigh)
		if !waist_size.blank? && thigh != 0
			where("ABS(thigh/waist - ?) < 0.03", thigh)
		else
			all
		end	
	end

	def self.knee_search(waist_size, knee)
		if !waist_size.blank? && knee != 0
			where("ABS(knee/waist - ?) < 0.03", knee)
		else
			all
		end	
	end

	def self.leg_opening_search(waist_size, leg_opening)
		if !waist_size.blank? && leg_opening != 0
			where("ABS(leg_opening/waist - ?) < 0.03", leg_opening)
		else
			all
		end	
	end

	def self.made_in_search(made_in)
		if !made_in.blank?
			where('made_in LIKE ?', made_in)
		else
			all
		end	
	end

	def self.fabric_origin_search(fabric_origin)
		if !fabric_origin.blank?
			where('fabric_origin LIKE ?', fabric_origin)
		else
			all
		end	
	end

	def self.color_search(color)
		if !color.blank?
			where('color LIKE ?', color)
		else
			all
		end	
	end

	def self.brand_search(brand)
		if !brand.blank?
			where('brand LIKE ?', brand)
		else
			all
		end	
	end

	def self.sanforized_search(sanforized)
		if !sanforized.blank?
			where('sanforized LIKE ?', sanforized)
		else
			all
		end	
	end

	def self.selvedge_search(selvedge)
		if !selvedge.blank?
			where('selvedge LIKE ?', selvedge)
		else
			all
		end	
	end
end
