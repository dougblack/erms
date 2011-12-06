class EsfsController < ApplicationController
  # GET /esfs
  # GET /esfs.json
  def index
    @esfs = Esf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @esfs }
    end
  end

  # GET /esfs/1
  # GET /esfs/1.json
  def show
    @esf = Esf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @esf }
    end
  end

  # GET /esfs/new
  # GET /esfs/new.json
  def new
    @esf = Esf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @esf }
    end
  end

  # GET /esfs/1/edit
  def edit
    @esf = Esf.find(params[:id])
  end

  # POST /esfs
  # POST /esfs.json
  def create
    @esf = Esf.new(params[:esf])

    respond_to do |format|
      if @esf.save
        format.html { redirect_to @esf, notice: 'Esf was successfully created.' }
        format.json { render json: @esf, status: :created, location: @esf }
      else
        format.html { render action: "new" }
        format.json { render json: @esf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /esfs/1
  # PUT /esfs/1.json
  def update
    @esf = Esf.find(params[:id])

    respond_to do |format|
      if @esf.update_attributes(params[:esf])
        format.html { redirect_to @esf, notice: 'Esf was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @esf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esfs/1
  # DELETE /esfs/1.json
  def destroy
    @esf = Esf.find(params[:id])
    @esf.destroy

    respond_to do |format|
      format.html { redirect_to esfs_url }
      format.json { head :ok }
    end
  end
end
