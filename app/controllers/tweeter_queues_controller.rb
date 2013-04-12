class TweeterQueuesController < ApplicationController
  # GET /tweeter_queues
  # GET /tweeter_queues.json
  def index
    @tweeter_queues = TweeterQueue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweeter_queues }
    end
  end

  # GET /tweeter_queues/1
  # GET /tweeter_queues/1.json
  def show
    @tweeter_queue = TweeterQueue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweeter_queue }
    end
  end

  # GET /tweeter_queues/new
  # GET /tweeter_queues/new.json
  def new
    @tweeter_queue = TweeterQueue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweeter_queue }
    end
  end

  # GET /tweeter_queues/1/edit
  def edit
    @tweeter_queue = TweeterQueue.find(params[:id])
  end

  # POST /tweeter_queues
  # POST /tweeter_queues.json
  def create
    @tweeter_queue = TweeterQueue.new(params[:tweeter_queue])

    respond_to do |format|
      if @tweeter_queue.save
        format.html { redirect_to @tweeter_queue, notice: 'Tweeter queue was successfully created.' }
        format.json { render json: @tweeter_queue, status: :created, location: @tweeter_queue }
      else
        format.html { render action: "new" }
        format.json { render json: @tweeter_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweeter_queues/1
  # PUT /tweeter_queues/1.json
  def update
    @tweeter_queue = TweeterQueue.find(params[:id])

    respond_to do |format|
      if @tweeter_queue.update_attributes(params[:tweeter_queue])
        format.html { redirect_to @tweeter_queue, notice: 'Tweeter queue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweeter_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeter_queues/1
  # DELETE /tweeter_queues/1.json
  def destroy
    @tweeter_queue = TweeterQueue.find(params[:id])
    @tweeter_queue.destroy

    respond_to do |format|
      format.html { redirect_to tweeter_queues_url }
      format.json { head :no_content }
    end
  end
end
