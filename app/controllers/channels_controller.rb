class ChannelsController < ApplicationController
  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel = Channel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
		if(signed_in?)
 		  @channel = Channel.new
 		  respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @channel }
    	end
		else
			redirect_to signin_path
		end	
  end

  # GET /channels/1/edit
  def edit
		if(signed_in?)  
    	@channel = Channel.find(params[:id])
		else
			redirect_to signin_path
		end	
  end

  # POST /channels
  # POST /channels.json
  def create
		if(signed_in?)
	    @channel = Channel.new(params[:channel])
	    respond_to do |format|
	      if @channel.save
	        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
	        format.json { render json: @channel, status: :created, location: @channel }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @channel.errors, status: :unprocessable_entity }
	      end
	    end
		else
			redirect_to signin_path
		end	
  end

  # PUT /channels/1
  # PUT /channels/1.json
  def update
		if(signed_in?)
   		@channel = Channel.find(params[:id])
	    respond_to do |format|
  	    if @channel.update_attributes(params[:channel])
   	     format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
    	    format.json { head :no_content }
   		  else
    	    format.html { render action: "edit" }
   	     format.json { render json: @channel.errors, status: :unprocessable_entity }
    	  end
	    end
		else
			redirect_to signin_path
		end	
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
		if(signed_in?)
   		@channel = Channel.find(params[:id])
   		@channel.destroy
	 		respond_to do |format|
      	format.html { redirect_to channels_url }
     		format.json { head :no_content }
    	end
		else
			redirect_to signin_path
		end	
  end
end
