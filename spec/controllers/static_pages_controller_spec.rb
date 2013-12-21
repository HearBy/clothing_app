require 'spec_helper'

describe StaticPagesController do
	describe "#home" do
		describe "true_waist_search" do
			before do
				@small_jean = create(:item, waist: 32)
				@large_jean = create(:item, waist: 33)
			end

			it "should only return locations with microposts" do
				get :home, { :waist => 32 }
				assigns(:jeans).map(&:id).should == [@small_jean.id]
			end
		end

		describe "price_search" do
			before do
				@cheap_model = create(:model, price: 100)
				@expensive_model = create(:model, price: 200)
				@cheap_jean = create(:item, model: @cheap_model)
				@expensive_jean = create(:item, model: @expensive_model)
			end

			it "should only return locations with microposts" do
				get :home, { :min_price => 75, :max_price => 150 }
				assigns(:jeans).map(&:id).should == [@cheap_jean.id]
			end
		end

		describe "fit_search" do
			before do
				@skinny_model = 		create(:model, fit: "skinny")
				@slim_straight_model =  create(:model, fit: "slim straight")
				@skinny_jean = create(:item, model: @skinny_model)
				@slim_straight_jean = create(:item, model: @slim_straight_model)
			end

			it "should only return locations with microposts" do
				get :home, { :fit => "skinny" }
				assigns(:jeans).map(&:id).should == [@skinny_jean.id]
			end
		end
	end
end