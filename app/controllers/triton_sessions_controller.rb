class TritonSessionsController < ApplicationController
  


# GET /triton_sessions
  # GET /triton_sessions.json
  def index
    @triton_sessions = TritonSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @triton_sessions }
    end
  end

  # GET /triton_sessions/1
  # GET /triton_sessions/1.json
  def show
    @triton_session = TritonSession.find(params[:id])

arr={}

Channel.all.each do |chan|
if chan.enabled

arr[chan.channelName] = {data:[],label:"#{chan.channelName}: #{(Point.where('triton_session_id=? AND channel_id=?',@triton_session.id,chan.id).last) ? Point.where('triton_session_id=? AND channel_id=?',@triton_session.id,chan.id).last.y : 'NaN'} K"}
	end
end


d=[]

@triton_session.points.sort_by(&:x).each do |point|
	if point.channel.enabled
		arr[point.channel.channelName][:data].push([point.x.to_f*1000+14400000,point.y])
		#d[point.channel_id-1][:data].push([point.x.to_f*1000+14400000,point.y])
	end
end

    respond_to do |format|
      format.html # show.html.erb
    # format.json { render json: @triton_session.points }

			format.json { render json: arr.values }
    end
  end

  # GET /triton_sessions/new
  # GET /triton_sessions/new.json
  def new
		if(signed_in?)
   	 @triton_session = TritonSession.new
    	respond_to do |format|
      	format.html # new.html.erb
     	 format.json { render json: @triton_session }
   	 end
		else
			redirect_to signin_path
		end
  end

  # GET /triton_sessions/1/edit
  def edit
 		if(signed_in?)  
 			@triton_session = TritonSession.find(params[:id])
 		else
			redirect_to signin_path
		end
 end

  # POST /triton_sessions
  # POST /triton_sessions.json
  def create
		if(signed_in?)
   	 @triton_session = TritonSession.new(params[:triton_session])
	    respond_to do |format|
     	 if @triton_session.save
       	 format.html { redirect_to @triton_session, notice: 'Triton session was successfully created.' }
      	  format.json { render json: @triton_session, status: :created, location: @triton_session }
    	  else
       	 format.html { render action: "new" }
       	 format.json { render json: @triton_session.errors, status: :unprocessable_entity }
      	end
    	end
		else
			redirect_to signin_path
		end
  end

  # PUT /triton_sessions/1
  # PUT /triton_sessions/1.json
  def update
		if(signed_in?)
    	@triton_session = TritonSession.find(params[:id])
	    respond_to do |format|
	      if @triton_session.update_attributes(params[:triton_session])
	        format.html { redirect_to @triton_session, notice: 'Triton session was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @triton_session.errors, status: :unprocessable_entity }
	      end
	    end
		else
			redirect_to signin_path
		end
  end

  # DELETE /triton_sessions/1
  # DELETE /triton_sessions/1.json
  def destroy
	 if(signed_in?)
   	 @triton_session = TritonSession.find(params[:id])
			@triton_session.points.each do |point|
				point.destroy		
			end	

    @triton_session.destroy

    respond_to do |format|
      format.html { redirect_to triton_sessions_url }
      format.json { head :no_content }
    end
	 else
			redirect_to signin_path
	 end
  end
	
	def last		
#redirect_to 	TritonSession.last

		respond_to do |format|
			format.html { redirect_to 	TritonSession.last}
			format.json { redirect_to "/triton_sessions/"+TritonSession.last.id.to_s+".json"}
		end
	end
	def current
		respond_to do |format|
			format.html { redirect_to TritonSession.last.points.last}
			format.json { redirect_to "/points/"+TritonSession.last.points.last.id.to_s+".json"}
		end
	end 
end
