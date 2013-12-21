class StaticPagesController < ApplicationController
  def home
  	@jeans = Item.true_waist_search(params[:waist])
  end

  def help
  end
end
