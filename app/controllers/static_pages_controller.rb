class StaticPagesController < ApplicationController
  def home
  	jeans = Item.true_waist_search(params[:waist])
  	jeans = jeans.price_search(params[:min_price], params[:max_price])
  	@jeans = jeans.fit_search(params[:fit])

  end

  def help
  end
end
