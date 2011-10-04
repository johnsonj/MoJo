
class ItemsController < ApplicationController
  include SessionsHelper
  include ActiveModel::Validations

  before_filter :ensure_permissions

validates :name, :length => { :minimum => 3 }
validates_numericality_of :longitude
validates_numericality_of :latitude


  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end


  def backpack
    @items = current_user.items
    respond_to do |format|
      format.json { render json: @items.to_json(:only => [:description, :id, :image_id, :latitude, :longitude, :name, :rarity]) }
    end
  end

  def nearby
    Location.ping(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])
    @items = Item.near([params[:latitude].to_f, params[:longitude].to_f], Item.NEAR_BY_DISTANCE).where(:user_id => User.WORLD_USER_ID)
  
    respond_to do |format|
      format.json { render json: @items.to_json(:only => [:description, :name, :rarity, :image_id, :distance ])  }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @item.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  def pickup
    @item = Item.find(params[:id])
    Location.ping(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])

    valid = @item.user_id == User.WORLD_USER_ID
    
    if valid
      @item.user_id = current_user.id
      @item.latitude = params[:latitutde]
      @item.longitude = params[:longitude]
      valid = @item.save
    end

    respond_to do |format|
      if valid
        format.json { render :json => 1 }
      else
        format.json { render :json => -1 }
      end
    end
  end

  def drop
    @item = Item.find(params[:id])
    Location.ping(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])

    valid = @item.user_id == current_user.id

    if valid
      @item.user_id = 0
      @item.latitude = params[:latitude]
      @item.longitude = params[:longitude]
      valid = @item.save
    end
    if valid
     history = ItemHistory.new()
     history.user_id = current_user.id
     history.item_id = params[:id]
     history.latitude = params[:latitude]
     history.longitude = params[:longitude]
     history.signature = params[:signature]
     valid = history.save()
   end

    respond_to do |format|
      if valid
        format.html # show.html.erb
        format.json { render :json => 1 }
      else
        format.json { render :json => 0, :status => :unprocessable_entry }
      end
    end

  end

  # POST /items
  # POST /items.json
  def create
   
    @flag = true
    params[:number].to_i.times {
    @item = Item.new( :name => params[:name], :description => params[:description], :image_id => params[:image_id], :rarity => params[:rarity] ) 

if params[:longitudeoffset].to_i != 0
    @item.longitude = rand(params[:longitudeoffset].to_i-1) + rand + params[:longitude].to_i
end

if params[:latitudeoffset].to_i != 0
    @item.latitude = rand(params[:latitudeoffset].to_i-1) + rand + params[:latitude].to_i
end

    @item.user_id = current_user.id
    @flag = @item.save
}
debugger

    respond_to do |format|
      if @flag
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
 
  private
  def ensure_permissions
    login_required
  end
  
end