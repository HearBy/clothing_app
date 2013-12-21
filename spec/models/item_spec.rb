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

	describe "price_search" do
		before do
			@cheap_model = create(:model, price: 100)
			@expensive_model = create(:model, price: 200)
			@cheap_jean = create(:item, model: @cheap_model)
			@expensive_jean = create(:item, model: @expensive_model)
		end

		it "should find the jean with price I'm looking for" do
			Item.price_search(75, 125).should include(@cheap_jean)
			Item.price_search(75, 125).should_not include(@expensive_jean)
		end

		it "should give me all jeans with no params[:min_price] or params[:max_price]" do
			Item.price_search(nil, nil).should include(@cheap_jean && @expensive_jean)
		end
	end

	describe "fit_search" do
		before do
			@skinny_model = 		create(:model, fit: "skinny")
			@slim_straight_model =  create(:model, fit: "slim straight")
			@skinny_jean = create(:item, model: @skinny_model)
			@slim_straight_jean = create(:item, model: @slim_straight_model)
		end

		it "should find the jean with the fit I'm looking for" do
			Item.fit_search("skinny").should include(@skinny_jean)
			Item.fit_search("skinny").should_not include(@slim_straight_jean)
			Item.fit_search("slim straight").should include(@slim_straight_jean)
			Item.fit_search("slim straight").should_not include(@skinny_jean)
		end
	end
end
