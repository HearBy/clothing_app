class Item < ActiveRecord::Base
	def self.sizer(waist_size, front_rise, thigh, knee, leg_opening)
		if waist_size
			where('waist <= ?', (waist_size.to_d + 0.25))
			.where('waist >= ?', (waist_size.to_d - 0.5))
			.where("ABS(front_rise/waist - ?) < 0.03", front_rise)
			.where("ABS(thigh/waist - ?) < 0.03", thigh)
			.where("ABS(knee/waist - ?) < 0.03", knee)
			.where("ABS(leg_opening/waist - ?) < 0.03", leg_opening)
		else
			all
		end
	end
end
