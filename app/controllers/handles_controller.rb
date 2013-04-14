class HandlesController < ApplicationController

  before_filter :default_values

  def default_values
      @handles = Handle.all
      @showNav = false
  end

  # GET /handles
  # GET /handles.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @handles }
    end
  end

  # GET /handles/1
  # GET /handles/1.json
  def show
    @handle = Handle.find(params[:id])
    @showNav = true
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @handle }
    end
  end

  # GET /handles/new
  # GET /handles/new.json
  def new
    @handle = Handle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @handle }
    end
  end

  # GET /handles/1/search
  # GET /handles/1/search.json
  def search
    @handle = Handle.find(params[:id])
    @showNav = true
  end

  # GET /handles/1/following
  # GET /handles/1/following.json
  def following
    @handle = Handle.find(params[:id])
    @showNav = true
    @following = Twitter.friends(@handle, {:cursor => -1, :skip_status => 't'}).users.to_json
  end

  # GET /handles/1/nudged
  # GET /handles/1/nudged.json
  def nudged
    @handle = Handle.find(params[:id])
    @showNav = true
    @nudged = Twitter.favorites(@handle, {:count => 50}).to_json
  end

  # GET /handles/1/edit
  def edit
    @handle = Handle.find(params[:id])
  end

  # POST /handles
  # POST /handles.json
  def create
    @handle = Handle.new(params[:handle])

    respond_to do |format|
      if @handle.save
        format.html { redirect_to @handle, notice: 'Handle was successfully created.' }
        format.json { render json: @handle, status: :created, location: @handle }
      else
        format.html { render action: "new" }
        format.json { render json: @handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /handles/1
  # PUT /handles/1.json
  def update
    @handle = Handle.find(params[:id])

    respond_to do |format|
      if @handle.update_attributes(params[:handle])
        format.html { redirect_to @handle, notice: 'Handle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @handle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handles/1
  # DELETE /handles/1.json
  def destroy
    @handle = Handle.find(params[:id])
    @handle.destroy

    respond_to do |format|
      format.html { redirect_to handles_url }
      format.json { head :no_content }
    end
  end
end
