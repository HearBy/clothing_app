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
	end
end