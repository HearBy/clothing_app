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
end
