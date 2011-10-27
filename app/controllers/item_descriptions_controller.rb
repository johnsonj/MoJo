require 'sessions_helper'

class ItemDescriptionsController < ApplicationController
  include SessionsHelper

  before_filter :admin_login_required, :except => [:show, :get_description_updates]
  before_filter :admin_or_app_required, :only => :show
  before_filter :app_required, :only => :get_description_updates

  # GET /item_descriptions
  # GET /item_descriptions.json
  def index
    @item_descriptions = ItemDescription.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_descriptions }
    end
  end

  # GET /item_descriptions/1
  # GET /item_descriptions/1.json
  def show
    @item_description = ItemDescription.find(params[:id]) if ItemDescription.exists?(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json do
        if @item_description
          render json: @item_description, :status => :ok
        else
          render json: "None Found", :status => :not_found
        end
      end
    end
  end

  # GET /item_descriptions/new
  # GET /item_descriptions/new.json
  def new
    @item_description = ItemDescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_description }
    end
  end

  # GET /item_descriptions/1/edit
  def edit
    @item_description = ItemDescription.find(params[:id])
  end

  # POST /item_descriptions
  # POST /item_descriptions.json
  def create
    @item_description = ItemDescription.new(params[:item_description])

    respond_to do |format|
      if @item_description.save
        format.html { redirect_to @item_description, notice: 'Item description was successfully created.' }
        format.json { render json: @item_description, status: :created, location: @item_description }
      else
        format.html { render action: "new" }
        format.json { render json: @item_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_descriptions/1
  # PUT /item_descriptions/1.json
  def update
    @item_description = ItemDescription.find(params[:id])

    respond_to do |format|
      if @item_description.update_attributes(params[:item_description])
        format.html { redirect_to @item_description, notice: 'Item description was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_descriptions/1
  # DELETE /item_descriptions/1.json
  def destroy
    @item_description = ItemDescription.find(params[:id])
    @item_description.destroy

    respond_to do |format|
      format.html { redirect_to item_descriptions_url }
      format.json { head :ok }
    end
  end

  def get_description_updates
    if params[:dateTime].blank?
      render :json => ItemDescription.all, :status => :ok
    else
      descriptions = ItemDescription.where("updated_at > ?", params[:dateTime].to_datetime.to_s(:db))
      if descriptions.first
        render :json => descriptions, :status => :ok
      else
        render :json => "No Updates Found", :status => :ok
      end
    end
  end
end
