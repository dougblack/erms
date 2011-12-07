class RequestsController < ApplicationController
  
  
    def make_request
        puts params
        r = Request.new
        r.resource_id = params[:r_id]
        r.incident_id = params[:i_id]
        if current_user.id == Resource.find_by_sql("SELECT * FROM resources WHERE id = #{params[:r_id]}").first.user_id
            r.status = "In Use"
        else
            r.status = "Requested"
        end
        if r.save
            redirect_to "/resources/status", :notice => "Successfully requested"
        else
            redirect_to "/resources/status", :notice => "Error requesting"
        end
    end
    def deploy
        puts params
        r = Request.new
        r.resource_id = params[:r_id]
        r.incident_id = params[:i_id]
        r.status = "In Use"
        if r.save
            redirect_to "/resources/status", :notice => "Successfully deployed"
        else
            redirect_to "/resources/status", :notice => "Error deploying"
        end
    end
    
    def return
        rq = Request.find_by_sql("SELECT * FROM requests WHERE #{params[:rq_id]}").first
        @i_id = rq.incident_id
        @r_id = rq.resource_id
        rq.destroy
        Request.find_byB_sql("SELECT * FROM requests ORDER BY created_at ASC").each do |rq|
            if rq.i_id == @i_id && rq.r_id == @r_id && rq.status = "Requested"
                rq.status = "In Use"
                if rq.save
                    redirect_to "/resources/status", :notice => "Successfully returned"
                else
                    redirect_to "/resources/status", :notice => "Error returning"
                end
            end
        end
        
        redirect_to "/", :notice => "Successfully returned"

    end
    def reject
        Request.find_by_sql("SELECT * FROM requests WHERE id = #{params[:id]}").first.destroy
    end
    def deploy_request
        rq = Request.find_by_id(params[:id])
        rq.status = "In Use"
        if rq.save
            redirect_to "/resources/status", :notice => "Successfully requested"
        else
            redirect_to "/resources/status", :notice => "Error requesting"
        end
    end
  
  
  
  
  
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :ok }
    end
  end
end
