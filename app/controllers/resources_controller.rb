class ResourcesController < ApplicationController
  before_filter :check_login

  def search
  end

  def search_results

    keyword = params[:keyword]
    esf_id = params[:all][:esf_id]
    distance = params[:distance]
    incident_id = params[:all][:incident_id]
    if !keyword.blank? || !esf_id.blank? || !distance.blank? || !incident_id.blank?
       (!esf_id.blank?) ? @first = Resource.where(:esf_id => esf_id) : @first = nil
       (@first) ? @second = @first.where('name LIKE ? or model LIKE ?', "%#{keyword}%", "%#{keyword}%") : @second = Resource.where('name LIKE ? or model LIKE ?', "%#{keyword}%", "%#{keyword}%")
       if !incident_id.blank? and !distance.blank?
             @i = Incident.find_by_id(incident_id)
             if @second
                 @second.each do |r|
                     (r.distanceFrom(@i) < distance.to_i) ? @results << r : 1+1
                  end
             else
                 @results = Resource.where(distanceFrom(@i) < distance.to_i).all
             end
       else
             @results = @second.all
       end
    else
       @results = Resource.find(:all)
    end
    @final_result = [@i, @results]
  end
  def status
    @user = current_user
  end 

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @costperitem = Costperitem.where(item: params[:resource][:costperitem]).first
    if @costperitem
        params[:resource][:costperitem] = @costperitem.id
    else
        params[:resource][:costperitem] = Costperitem.create(item: params[:costperitem])
    end
    params[:resource][:user_id] = current_user
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :ok }
    end
  end
end
