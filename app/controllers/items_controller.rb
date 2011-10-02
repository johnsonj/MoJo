class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def testnew
    puts "sh dfkshdf ksdf"
    @item = Item.new
    @item.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def backpack
    @items = current_user.items
    respond_to do |format|
      format.html
      format.json { render json: @items }
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
        format.html # show.html.erb
        format.json { render :json => @item }
      else
        format.json { render :json => @item.errors, :status => :unprocessable_entry }
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
        format.json { render :json => @item }
      else
        format.json { render :json => @item.errors, :status => :unprocessable_entry }
      end
    end

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
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
end
