class ItemsController < ApplicationController
  def index
    @waist = 1   
    @front_rise = 1
    @thigh =  1 
    @knee =  1
    @leg_opening = 1

    if params[:waist]
    	@waist = 	   params[:waist].to_f/params[:waist].to_f
    	@front_rise =  params[:front_rise].to_f/params[:waist].to_f
    	@thigh =	   params[:thigh].to_f/params[:waist].to_f
    	@knee =		   params[:knee].to_f/params[:waist].to_f
    	@leg_opening = params[:leg_opening].to_f/params[:waist].to_f
    end
    @items = Item.sizer(params[:waist], @front_rise, @thigh, @knee, @leg_opening)
  end

  def show
  	@item = Item.find(params[:id])
  	@parse = ''
  	if params[:parse]
  		c = params[:parse]
  		@tag_size =    c.split(',')[0].split('Size ')[1].split(' (')[0] 
        @waist =       c.split('(')[1].split('"')[0] 
        @front_rise =  c.split('(')[1].split('"')[1].split(', ')[1] 
        @thigh =       c.split('(')[1].split('"')[2].split(', ')[1] 
        @knee =        c.split('(')[1].split('"')[3].split(', ')[1] 
        @leg_opening = c.split('(')[1].split('"')[5].split(', ')[1]
        @inseam =      c.split('(')[1].split('"')[4].split(', ')[1] 
    end
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
