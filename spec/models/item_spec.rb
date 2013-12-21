require 'spec_helper'

describe Item do

	before do 
		@item = create(:item)
	end

	subject { @item }

	it { should respond_to(:waist) }
	it { should respond_to(:front_rise) }
	it { should respond_to(:thigh) }
	it { should respond_to(:knee) }
	it { should respond_to(:leg_opening) }
	it { should respond_to(:inseam) }
	it { should respond_to(:tag_size) }
	it { should respond_to(:model_id) }
end
