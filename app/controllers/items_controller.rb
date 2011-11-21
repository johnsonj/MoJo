class ItemsController < ApplicationController
  include SessionsHelper
  include ItemHistoriesHelper
  include ActiveModel::Validations

  before_filter :admin_login_required, :only => [:index, :new, :create, :destroy, :edit, :multi_new_random, :multi_create_scatter, :master_map]
  before_filter :login_required, :only => [:backpack, :nearby, :update, :drop, :pickup]
  before_filter :admin_or_has_owned, :only => :show

  # GET /items
  # GET /items.json
  def index
    @items = Item.paginate(:page => params[:page])
  end

  def user_item_history
    item_ids = []
    ItemHistory.select("item_id").where(:user_id => current_user.id).group("item_id").each do |hist|
      item_ids << hist.item_id
    end
    @items = Item.find(item_ids)
  end

  def backpack
    @items = current_user.items
    @histories = current_user.item_histories.first(4)
    respond_to do |format|
      format.html
      format.json { render json: @items.to_json(:only => [:item_description_id, :id, :latitude, :longitude]) }
    end
  end

  def nearby
    Location.record_location(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])
    items = Item.near([params[:latitude].to_f, params[:longitude].to_f], NEAR_BY_DISTANCE).where(:user_id => WORLD_USER_ID)

    respond_to do |format|
      format.json { render json: items.to_json(:only => [:item_description_id, :id, :distance]) }
    end
  end

  def density
    items = Item.near([params[:latitude].to_f, params[:longitude].to_f], params[:distance].to_f).where(:user_id => WORLD_USER_ID)
    items = items.where(:item_description_id => params[:item_description_id]) if params[:item_description_id]
    
    respond_to do |format|
      format.json { render json: {:density => items.all.count} }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
    else
      redirect_to :home_page
      return
    end
    lats = []
    longs = []
    @item.item_histories.each do |it|
      lats << it.latitude
      longs << it.longitude
    end
    @positions = {:longs => longs, :lats => lats, :histories => @item.item_histories.paginate(:page => params[:page], :per_page => 10)}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def multi_new_random
  end

  def multi_new_specific
  end


  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @item.user_id = 0
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  def pickup
    @item = Item.find(params[:id])
    Location.record_location(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])

    valid = @item.user_id == WORLD_USER_ID
    valid = valid && (@item.distance_to([params[:latitude].to_f, params[:longitude].to_f]) <= NEAR_BY_DISTANCE)
    if valid
      @item.user_id = current_user.id
      @item.latitude = params[:latitude]
      @item.longitude = params[:longitude]
      valid = @item.save
    end

    respond_to do |format|
      if valid
        format.json { render :json => 1 }
      else
        format.json { render :json => -1, :status => :unprocessable_entry }
      end
    end
  end

  def drop
    @item = Item.find(params[:id])
    Location.record_location(:user => current_user, :latitude => params[:latitude], :longitude => params[:longitude], :timestamp => params[:timestamp])

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
        format.json { render :json => 1 }
      else
        format.json { render :json => 0, :status => :unprocessable_entry }
      end
    end

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: "new"
    end
  end


  def multi_create_scatter
    @flag = true
    params[:number].to_i.times do
      @item = Item.new({:item_description_id => params[:item_description_id], :user_id => 0})
      offset = params[:offset].to_f
      if offset != 0
        lon = params[:longitude].to_f
        @item.longitude = rand * ((lon + offset) - (lon - offset)) + (lon - offset)
        if @item.longitude < -180
          @item.longitude = -179.9
        end
        if @item.longitude > 180
          @item.longitude = 179.9
        end

        lat = params[:latitude].to_f
        @item.latitude = rand * ((lat + offset) - (lat - offset)) + (lat - offset)
        if @item.latitude < -90
          @item.latitude = -89.9
        end
        if @item.latitude > 90
          @item.latitude = 89.9
        end
      else
        @item.latitude = params[:latitude]
        @item.longitude = params[:longitude]
      end
      @flag = @item.save
    end


    if @flag
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      format.html { render action: "new" }
    end

  end

  def multi_create_specific
    lats = params[:latitudes]
    longs = params[:longitudes]
    description_id = params[:item_description_id]

    (0..lats.size).each do |i|
      item = Item.new({:item_description_id => description_id,
                       :user_id => 0,
                       :latitude => lats[i],
                       :longitude => longs[i]})
      if item.save
        flash[:success] = "#{lats.size} items successfully created"
      else
        flash[:error] = "ERROR"
      end
    end

    redirect_to items_path
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
    redirect_to items_url
  end

  def master_map
    @lats = []
    @longs = []
    Item.all.each do |item|
      @lats << item.latitude
      @longs << item.longitude
    end
  end

end
