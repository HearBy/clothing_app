require 'spec_helper'

describe Model do

	before do 
		@model = create(:model)
	end

	subject { @model }

	it { should respond_to(:name) }
	it { should respond_to(:brand) }
	it { should respond_to(:fabric_origin) }
	it { should respond_to(:made_in) }
	it { should respond_to(:price) }
	it { should respond_to(:denim_weight) }
	it { should respond_to(:color) }
	it { should respond_to(:fit) }
	it { should respond_to(:sanforized) }
	it { should respond_to(:stretch) }
	it { should respond_to(:selvedge) }
	it { should respond_to(:url) }
end
