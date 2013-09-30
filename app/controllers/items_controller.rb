class ItemsController < ApplicationController
  def index
  	@items = Item.all
  	@test = params[:test]
  end

  def show
  	@item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  		flash[:success] = "New item added to database"
  		redirect_to items_path
  	else
  		render new_item_path
  	end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])

  	if @item.update_attributes(item_params)
  		flash[:success] = "Item has been updated"
  		redirect_to item_path(params[:id])
  	end
  end

  def item_params
  	params.require(:item).permit(:name, :waist, 
							:front_rise, :thigh, :knee,
							:leg_opening, :price, :color,
							:brand, :link, :denim_weight,
							:sanforized, :inseam, 
							:tag_size)
  end
end
