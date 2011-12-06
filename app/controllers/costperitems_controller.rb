class CostperitemsController < ApplicationController
  # GET /costperitems
  # GET /costperitems.json
  def index
    @costperitems = Costperitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costperitems }
    end
  end

  # GET /costperitems/1
  # GET /costperitems/1.json
  def show
    @costperitem = Costperitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costperitem }
    end
  end

  # GET /costperitems/new
  # GET /costperitems/new.json
  def new
    @costperitem = Costperitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costperitem }
    end
  end

  # GET /costperitems/1/edit
  def edit
    @costperitem = Costperitem.find(params[:id])
  end

  # POST /costperitems
  # POST /costperitems.json
  def create
    @costperitem = Costperitem.new(params[:costperitem])

    respond_to do |format|
      if @costperitem.save
        format.html { redirect_to @costperitem, notice: 'Costperitem was successfully created.' }
        format.json { render json: @costperitem, status: :created, location: @costperitem }
      else
        format.html { render action: "new" }
        format.json { render json: @costperitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costperitems/1
  # PUT /costperitems/1.json
  def update
    @costperitem = Costperitem.find(params[:id])

    respond_to do |format|
      if @costperitem.update_attributes(params[:costperitem])
        format.html { redirect_to @costperitem, notice: 'Costperitem was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @costperitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costperitems/1
  # DELETE /costperitems/1.json
  def destroy
    @costperitem = Costperitem.find(params[:id])
    @costperitem.destroy

    respond_to do |format|
      format.html { redirect_to costperitems_url }
      format.json { head :ok }
    end
  end
end
