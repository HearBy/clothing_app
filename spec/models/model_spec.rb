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

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:brand) }
	it { should validate_presence_of(:fabric_origin) }
	it { should validate_presence_of(:made_in) }
	it { should validate_presence_of(:price) }
	it { should validate_presence_of(:denim_weight) }
	it { should validate_presence_of(:color) }
	it { should validate_presence_of(:fit) }
	it { should validate_presence_of(:url) }

	it { should validate_numericality_of(:price).is_greater_than_or_equal_to(20).is_less_than_or_equal_to(1000) }

	describe "when fit is not one of 4 options" do
		before { @model.fit = "test" }
		
		it { should_not be_valid }

		describe "skinny" do
			describe "valid" do
			    before { @model.fit = "skinny" }
			    it { should be_valid }
			end

			describe "not valid" do
			    before { @model.fit = "Skinny" }
			    it { should_not be_valid }
			end
		end

		describe "slim straight" do
			describe "valid" do
			    before { @model.fit = "slim straight" }
			    it { should be_valid }
			end

			describe "not valid" do
			    before { @model.fit = "Slim straight" }
			    it { should_not be_valid }
			end
		end

		describe "straight" do
			describe "valid" do
			    before { @model.fit = "straight" }
			    it { should be_valid }
			end

			describe "not valid" do
			    before { @model.fit = "Straight" }
			    it { should_not be_valid }
			end
		end

		describe "tapered" do
			describe "valid" do
			    before { @model.fit = "tapered" }
			    it { should be_valid }
			end

			describe "not valid" do
			    before { @model.fit = "Tapered" }
			    it { should_not be_valid }
			end
		end
	end

	describe "price_search" do
		before do
			@cheap_model = 		create(:model, price: 100)
			@expensive_model =  create(:model, price: 200)
		end

		it "should find the jean with price I'm looking for" do
			Model.price_search(75, 125).should include(@cheap_model)
			Model.price_search(75, 125).should_not include(@expensive_model)
		end
	end

	describe "fit_search" do
		before do
			@skinny_model = 		create(:model, fit: "skinny")
			@slim_straight_model =  create(:model, fit: "slim straight")
		end

		it "should find the jean with the fit I'm looking for" do
			Model.fit_search("skinny").should include(@skinny_model)
			Model.fit_search("skinny").should_not include(@slim_straight_model)
			Model.fit_search("slim straight").should include(@slim_straight_model)
			Model.fit_search("slim straight").should_not include(@skinny_model)
		end
	end
end
