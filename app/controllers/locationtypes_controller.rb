class LocationtypesController < ApplicationController
  # GET /locationtypes
  # GET /locationtypes.xml
  def index
    @locationtypes = Locationtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locationtypes }
    end
  end

  # GET /locationtypes/1
  # GET /locationtypes/1.xml
  def show
    @locationtype = Locationtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locationtype }
    end
  end

  # GET /locationtypes/new
  # GET /locationtypes/new.xml
  def new
    @locationtype = Locationtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locationtype }
    end
  end

  # GET /locationtypes/1/edit
  def edit
    @locationtype = Locationtype.find(params[:id])
  end

  # POST /locationtypes
  # POST /locationtypes.xml
  def create
    @locationtype = Locationtype.new(params[:locationtype])

    respond_to do |format|
      if @locationtype.save
        format.html { redirect_to(@locationtype, :notice => 'Locationtype was successfully created.') }
        format.xml  { render :xml => @locationtype, :status => :created, :location => @locationtype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locationtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locationtypes/1
  # PUT /locationtypes/1.xml
  def update
    @locationtype = Locationtype.find(params[:id])

    respond_to do |format|
      if @locationtype.update_attributes(params[:locationtype])
        format.html { redirect_to(@locationtype, :notice => 'Locationtype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locationtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locationtypes/1
  # DELETE /locationtypes/1.xml
  def destroy
    @locationtype = Locationtype.find(params[:id])
    @locationtype.destroy

    respond_to do |format|
      format.html { redirect_to(locationtypes_url) }
      format.xml  { head :ok }
    end
  end
end
