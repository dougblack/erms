class GovernmentagenciesController < ApplicationController
  # GET /governmentagencies
  # GET /governmentagencies.json
  def index
    @governmentagencies = Governmentagency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @governmentagencies }
    end
  end

  # GET /governmentagencies/1
  # GET /governmentagencies/1.json
  def show
    @governmentagency = Governmentagency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @governmentagency }
    end
  end

  # GET /governmentagencies/new
  # GET /governmentagencies/new.json
  def new
    @governmentagency = Governmentagency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @governmentagency }
    end
  end

  # GET /governmentagencies/1/edit
  def edit
    @governmentagency = Governmentagency.find(params[:id])
  end

  # POST /governmentagencies
  # POST /governmentagencies.json
  def create
    @governmentagency = Governmentagency.new(params[:governmentagency])

    respond_to do |format|
      if @governmentagency.save
        format.html { redirect_to @governmentagency, notice: 'Governmentagency was successfully created.' }
        format.json { render json: @governmentagency, status: :created, location: @governmentagency }
      else
        format.html { render action: "new" }
        format.json { render json: @governmentagency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /governmentagencies/1
  # PUT /governmentagencies/1.json
  def update
    @governmentagency = Governmentagency.find(params[:id])

    respond_to do |format|
      if @governmentagency.update_attributes(params[:governmentagency])
        format.html { redirect_to @governmentagency, notice: 'Governmentagency was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @governmentagency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /governmentagencies/1
  # DELETE /governmentagencies/1.json
  def destroy
    @governmentagency = Governmentagency.find(params[:id])
    @governmentagency.destroy

    respond_to do |format|
      format.html { redirect_to governmentagencies_url }
      format.json { head :ok }
    end
  end
end
