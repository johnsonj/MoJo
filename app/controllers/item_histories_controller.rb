class ItemHistoriesController < ApplicationController
  include SessionsHelper

  before_filter :admin_login_required, :except => :itemDetails
  before_filter :app_required, :only => :itemDetails

  # GET /item_histories
  # GET /item_histories.json
  def index
    @item_histories = ItemHistory.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_histories }
    end
  end

  def mapHistory
    @result = Array.new()
    Item.limit(500).all.each do |i|
      @history = Array.new()
      i.item_histories.reverse.each do |h|
        hist = {lng: h.longitude, lat: h.latitude, time: h.stamp.to_time.to_i}
        puts hist.to_json
        @history.push(hist)
      end
      @result.push({state: 0, lng: -999, lat: -999, Vlng: -999, Vlat: -999, path: @history}) if @history.length > 0
    end    
    respond_to do |format|
      format.json { render json: @result.to_json }
    end
  end
  def itemDetails
    @item = Item.find(params[:id]) if Item.exists?(params[:id])
    @item_histories = @item.item_histories if @item
    respond_to do |format|
      if @item_histories
        format.json { render json: @item_histories.to_json(:only => [:id, :item_id, :latitude, :longitude, :runningdistance, :signature, :stamp, :user_id]) }
      else
        format.json { render json: 0, status: :not_found }
      end
    end
  end 
  # GET /item_histories/1
  # GET /item_histories/1.json
  def show
    @item_history = ItemHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_history }
    end
  end

  # GET /item_histories/new
  def new
    @item_history = ItemHistory.new
  end

  # GET /item_histories/1/edit
  def edit
    @item_history = ItemHistory.find(params[:id])
  end

  # POST /item_histories
  # POST /item_histories.json
  def create
    @item_history = ItemHistory.new(params[:item_history])

    respond_to do |format|
      if @item_history.save
        format.html { redirect_to @item_history, notice: 'Item history was successfully created.' }
        format.json { render json: @item_history, status: :created, location: @item_history }
      else
        format.html { render action: "new" }
        format.json { render json: @item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_histories/1
  # PUT /item_histories/1.json
  def update
    @item_history = ItemHistory.find(params[:id])

    respond_to do |format|
      if @item_history.update_attributes(params[:item_history])
        format.html { redirect_to @item_history, notice: 'Item history was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_histories/1
  # DELETE /item_histories/1.json
  def destroy
    @item_history = ItemHistory.find(params[:id])
    @item_history.destroy

    respond_to do |format|
      format.html { redirect_to item_histories_url }
      format.json { head :ok }
    end
  end

end
