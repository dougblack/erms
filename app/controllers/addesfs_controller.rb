class AddesfsController < ApplicationController
  # GET /addesfs
  # GET /addesfs.json
  def index
    @addesfs = Addesf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addesfs }
    end
  end

  # GET /addesfs/1
  # GET /addesfs/1.json
  def show
    @addesf = Addesf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @addesf }
    end
  end

  # GET /addesfs/new
  # GET /addesfs/new.json
  def new
    @addesf = Addesf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @addesf }
    end
  end

  # GET /addesfs/1/edit
  def edit
    @addesf = Addesf.find(params[:id])
  end

  # POST /addesfs
  # POST /addesfs.json
  def create
    @addesf = Addesf.new(params[:addesf])

    respond_to do |format|
      if @addesf.save
        format.html { redirect_to @addesf, notice: 'Addesf was successfully created.' }
        format.json { render json: @addesf, status: :created, location: @addesf }
      else
        format.html { render action: "new" }
        format.json { render json: @addesf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /addesfs/1
  # PUT /addesfs/1.json
  def update
    @addesf = Addesf.find(params[:id])

    respond_to do |format|
      if @addesf.update_attributes(params[:addesf])
        format.html { redirect_to @addesf, notice: 'Addesf was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @addesf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addesfs/1
  # DELETE /addesfs/1.json
  def destroy
    @addesf = Addesf.find(params[:id])
    @addesf.destroy

    respond_to do |format|
      format.html { redirect_to addesfs_url }
      format.json { head :ok }
    end
  end
end
