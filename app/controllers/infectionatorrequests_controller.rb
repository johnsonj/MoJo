class InfectionatorrequestsController < ApplicationController
  # GET /infectionatorrequests
  # GET /infectionatorrequests.xml
  def index
    @infectionatorrequests = Infectionatorrequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @infectionatorrequests }
    end
  end

  # GET /infectionatorrequests/1
  # GET /infectionatorrequests/1.xml
  def show
    @infectionatorrequest = Infectionatorrequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @infectionatorrequest }
    end
  end

  # GET /infectionatorrequests/new
  # GET /infectionatorrequests/new.xml
  def new
    @infectionatorrequest = Infectionatorrequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @infectionatorrequest }
    end
  end

  # GET /infectionatorrequests/1/edit
  def edit
    @infectionatorrequest = Infectionatorrequest.find(params[:id])
  end

  # POST /infectionatorrequests
  # POST /infectionatorrequests.xml
  def create
    @infectionatorrequest = Infectionatorrequest.new(params[:infectionatorrequest])

    respond_to do |format|
      if @infectionatorrequest.save
        format.html { redirect_to(@infectionatorrequest, :notice => 'Infectionatorrequest was successfully created.') }
        format.xml  { render :xml => @infectionatorrequest, :status => :created, :location => @infectionatorrequest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @infectionatorrequest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /infectionatorrequests/1
  # PUT /infectionatorrequests/1.xml
  def update
    @infectionatorrequest = Infectionatorrequest.find(params[:id])

    respond_to do |format|
      if @infectionatorrequest.update_attributes(params[:infectionatorrequest])
        format.html { redirect_to(@infectionatorrequest, :notice => 'Infectionatorrequest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @infectionatorrequest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /infectionatorrequests/1
  # DELETE /infectionatorrequests/1.xml
  def destroy
    @infectionatorrequest = Infectionatorrequest.find(params[:id])
    @infectionatorrequest.destroy

    respond_to do |format|
      format.html { redirect_to(infectionatorrequests_url) }
      format.xml  { head :ok }
    end
  end
end
