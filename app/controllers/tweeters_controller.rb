class TweetersController < ApplicationController
  # GET /tweeters
  # GET /tweeters.json
  def index
    @tweeters = Tweeter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweeters }
    end
  end

  # GET /tweeters/1
  # GET /tweeters/1.json
  def show
    @tweeter = Tweeter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweeter }
    end
  end

  # GET /tweeters/new
  # GET /tweeters/new.json
  def new
    @tweeter = Tweeter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweeter }
    end
  end

  # GET /tweeters/1/edit
  def edit
    @tweeter = Tweeter.find(params[:id])
  end

  # POST /tweeters
  # POST /tweeters.json
  def create
    @tweeter = Tweeter.new(params[:tweeter])

    respond_to do |format|
      if @tweeter.save
        format.html { redirect_to @tweeter, notice: 'Tweeter was successfully created.' }
        format.json { render json: @tweeter, status: :created, location: @tweeter }
      else
        format.html { render action: "new" }
        format.json { render json: @tweeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweeters/1
  # PUT /tweeters/1.json
  def update
    @tweeter = Tweeter.find(params[:id])

    respond_to do |format|
      if @tweeter.update_attributes(params[:tweeter])
        format.html { redirect_to @tweeter, notice: 'Tweeter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeters/1
  # DELETE /tweeters/1.json
  def destroy
    @tweeter = Tweeter.find(params[:id])
    @tweeter.destroy

    respond_to do |format|
      format.html { redirect_to tweeters_url }
      format.json { head :no_content }
    end
  end
end
