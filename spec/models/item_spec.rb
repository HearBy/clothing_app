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

	it { should validate_numericality_of(:waist).is_greater_than_or_equal_to(26).is_less_than_or_equal_to(42) }
	it { should validate_numericality_of(:front_rise).is_greater_than_or_equal_to(8).is_less_than_or_equal_to(13) }
	it { should validate_numericality_of(:thigh) }
	it { should validate_numericality_of(:knee) }
	it { should validate_numericality_of(:leg_opening) }
	it { should validate_numericality_of(:inseam) }
	it { should validate_numericality_of(:tag_size) }

	describe "true_waist_search" do
		before do
			@small_jean = create(:item, waist: 32)
			@large_jean = create(:item, waist: 33)
		end

		it "should find the jean size I'm looking for" do
			Item.true_waist_search(32).should include(@small_jean)
			Item.true_waist_search(32).should_not include(@large_jean)
		end

		it "should give me all jeans with no params[:waist]" do
			Item.true_waist_search(nil).should include(@small_jean && @large_jean)
		end
	end
end
