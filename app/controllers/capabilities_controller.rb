class CapabilitiesController < ApplicationController
  # GET /capabilities
  # GET /capabilities.json
  def index
    @capabilities = Capability.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capabilities }
    end
  end

  # GET /capabilities/1
  # GET /capabilities/1.json
  def show
    @capability = Capability.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capability }
    end
  end

  # GET /capabilities/new
  # GET /capabilities/new.json
  def new
    @capability = Capability.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capability }
    end
  end

  # GET /capabilities/1/edit
  def edit
    @capability = Capability.find(params[:id])
  end

  # POST /capabilities
  # POST /capabilities.json
  def create
    @capability = Capability.new(params[:capability])

    respond_to do |format|
      if @capability.save
        format.html { redirect_to @capability, notice: 'Capability was successfully created.' }
        format.json { render json: @capability, status: :created, location: @capability }
      else
        format.html { render action: "new" }
        format.json { render json: @capability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capabilities/1
  # PUT /capabilities/1.json
  def update
    @capability = Capability.find(params[:id])

    respond_to do |format|
      if @capability.update_attributes(params[:capability])
        format.html { redirect_to @capability, notice: 'Capability was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @capability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capabilities/1
  # DELETE /capabilities/1.json
  def destroy
    @capability = Capability.find(params[:id])
    @capability.destroy

    respond_to do |format|
      format.html { redirect_to capabilities_url }
      format.json { head :ok }
    end
  end
end
