class BagtypesController < ApplicationController
  include SessionsHelper

  before_filter :admin_login_required

  # GET /bagtypes
  # GET /bagtypes.json
  def index
    @bagtypes = Bagtype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bagtypes }
    end
  end

  # GET /bagtypes/1
  # GET /bagtypes/1.json
  def show
    @bagtype = Bagtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bagtype }
    end
  end

  # GET /bagtypes/new
  # GET /bagtypes/new.json
  def new
    @bagtype = Bagtype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bagtype }
    end
  end

  # GET /bagtypes/1/edit
  def edit
    @bagtype = Bagtype.find(params[:id])
  end

  # POST /bagtypes
  # POST /bagtypes.json
  def create
    @bagtype = Bagtype.new(params[:bagtype])

    respond_to do |format|
      if @bagtype.save
        format.html { redirect_to @bagtype, notice: 'Bagtype was successfully created.' }
        format.json { render json: @bagtype, status: :created, location: @bagtype }
      else
        format.html { render action: "new" }
        format.json { render json: @bagtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bagtypes/1
  # PUT /bagtypes/1.json
  def update
    @bagtype = Bagtype.find(params[:id])

    respond_to do |format|
      if @bagtype.update_attributes(params[:bagtype])
        format.html { redirect_to @bagtype, notice: 'Bagtype was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bagtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bagtypes/1
  # DELETE /bagtypes/1.json
  def destroy
    @bagtype = Bagtype.find(params[:id])
    @bagtype.destroy

    respond_to do |format|
      format.html { redirect_to bagtypes_url }
      format.json { head :ok }
    end
  end
end
