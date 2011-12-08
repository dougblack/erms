class ResourcesController < ApplicationController
  before_filter :check_login

  def search
      @incidents = current_user.incidents
  end
  
  def report
      @esfs = Esf.all
  end
  
  def status
      puts "Hi"
      @user_resource_requests = []
      @user_resources = []
      @user_incidents = []
      @user_resource_requests = []
      @requests_sent = []
      @requests_received = []
      @user_resources = current_user.resources
      puts "Resources: #{@user_resources}"
      @user_incidents = current_user.incidents
      puts "Incidents: #{@user_incidents}"
      # All requests where the user owns the incident and the incident is in use
      @user_incidents.each do |i|
              @user_resource_requests = @user_resource_requests + Request.find_by_sql("SELECT * FROM requests WHERE incident_id = #{i.id} AND status = 'In Use'")
             
              #     if rq.status == "In Use"
              #         puts "Added: #{rq}"
              #         puts rq.name
              #          << rq
              #     end
              # end
      end
      # All requests where the incident is user owned and not in use
      @user_incidents.each do |i|
              @requests_sent = @requests_sent + Request.find_by_sql("SELECT * FROM requests WHERE incident_id = #{i.id} AND status = 'Requested'")
      end
      # All requests where the users resources are involved
      @user_resources.each do |r|
            @requests_received = @requests_received + Request.find_by_sql("SELECT * FROM requests WHERE incident_id = #{r.id} AND status = 'Requested'")
      end
       puts "user #{@user_resource_requests}"
       puts "sent #{@requests_sent}"
       puts "received #{@requests_received}"
  end
  def search_results

    keyword = params[:keyword].downcase
    esf_id = params[:all][:esf_id]
    distance = params[:distance]
    incident_id = params[:all][:incident_id]
    @results = []
    if !keyword.blank? || !esf_id.blank? || !distance.blank? || !incident_id.blank?
       if !esf_id.blank?
           @first = Resource.find_by_sql("SELECT * FROM resources WHERE esf_id = #{esf_id}")
           Addesf.find_by_sql("SELECT * FROM addesfs WHERE esf_id = #{esf_id}").each do |a|
               puts a
               @first << Resource.find_by_sql("SELECT * FROM resources WHERE id = #{a.resource_id}").first
           end
       else
            @first = nil
       end
       if !keyword.blank?
           @second = []
           if @first 
               @first.each do |r|
                   if r.name.downcase.index(keyword) or r.model.downcase.index(keyword)
                       @second << r
                   else 
                       puts "Checking capabilities"
                       r.capabilities.each do |c|
                           if c.capability.index(keyword)
                               @second << r
                               break
                           end
                       end
                   end
               end
               
           else
               Resource.all.each do |r|
                      if r.name.downcase.index(keyword) or r.model.downcase.index(keyword)
                            @second << r
                        else 
                            r.capabilities.each do |c|
                                puts "Checking capabilities2"
                                if c.capability.downcase.index(keyword)
                                    @second << r
                                    break
                                end
                            end
                        end
                  end
           end
       else
           @second = @first
       end
       if !incident_id.blank? and !distance.blank?
             @i = Incident.find_by_sql("SELECT * FROM incidents WHERE id = #{incident_id}").first
             if @second
                 @results = []
                 @second.each do |r|
                     (r.distanceFrom(@i) < distance.to_i) ? @results << r : 1+1
                  end
             else
                 Resource.all.each do |r|
                   if r.distanceFrom(@i) < distance.to_i
                     puts "Found resources!"
                     puts r.name
                     @results << r
                   end
                 end
             end
       else
             @results = @second
       end
    else
       @results = Resource.find_by_sql("SELECT * FROM resources")
    end
    @final_result = [@i, @results]
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
    3.times {
        @resource.capabilities.build
    }
    puts @resource.capabilities
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
        params[:resource][:costperitem] = @costperitem
    else
        @new_cost = Costperitem.new
        @new_cost.item = params[:resource][:costperitem]
        @new_cost.save
        params[:resource][:costperitem] = @new_cost
    end
    params[:resource][:user_id] = current_user
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        if params[:add_esfs]
            params[:add_esfs].each do |e|
              e = Addesf.create(:resource_id => @resource.id, :esf_id => e.to_i)
            end
        end
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
