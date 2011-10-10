class LocationsController < ApplicationController
  include SessionsHelper

  before_filter :login_and_access, :only => [:record_location]

  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.json { render :json => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def record_location
    @location = Location.new()
    @location.user = current_user
    @location.latitude = params[:latitude]
    @location.longitude = params[:longitude]
    @location.timestamp = params[:timestamp]

    respond_to do |format|
      if @location.save
        format.html { redirect_to(@location, :notice => 'Location was successfully created.') }
        format.json { render :json => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_locations_for_range
    starting = params[:start]
    ending = params[:end]
    respond_to do |format|
      if starting and ending and hasAccess(:interactions, params[:appKey])
        if params[:count]
          format.json { render :json => Location.where(:timestamp => starting.to_datetime..ending.to_datetime).count }
        else
          format.json { render :json => Location.where(:timestamp => starting.to_datetime..ending.to_datetime) }
        end
      else
        format.json { render :json => "Invalid Range or AppKey", :status => :not_acceptable }
      end
    end
  end

  def get_locations_for_range_in_area
    starting = params[:start]
    ending = params[:end]
    startLat = params[:startingLatitude]
    endLat = params[:endingLatitude]
    startLon = params[:startingLongitude]
    endLon = params[:endingLongitude]

    respond_to do |format|
      if starting and ending and hasAccess(:interactions, params[:appKey])
        if params[:count]
          format.json { render :json => Location.where(:timestamp => starting.to_datetime..ending.to_datetime,
                                                     :longitude => startLon..endLon,
                                                     :latitude => startLat..endLat).count }
          else
          format.json { render :json => Location.where(:timestamp => starting.to_datetime..ending.to_datetime,
                                                     :longitude => startLon..endLon,
                                                     :latitude => startLat..endLat) }
          end
       else
        format.json { render :json => "Invalid Range or AppKey", :status => :not_acceptable }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to(@location, :notice => 'Location was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.json { head :ok }
    end
  end

  private
  def login_and_access
    unless ((hasAccess(:app, params[:appKey]) or hasAccess(:interactions, params[:appKey])) and isLoggedIn?)
      false
    end
  end

end
