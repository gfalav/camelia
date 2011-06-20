class VanosController < ApplicationController
  
  # GET /vanos
  # GET /vanos.xml
  def index
    @vanos = Vano.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vanos }
    end
  end

  # GET /vanos/1
  # GET /vanos/1.xml
  def show
    @vano = Vano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vano }
    end
  end

  # GET /vanos/new
  # GET /vanos/new.xml
  def new
    @vano = Vano.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vano }
    end
  end

  # GET /vanos/1/edit
  def edit
    @vano = Vano.find(params[:id])
  end

  # POST /vanos
  # POST /vanos.xml
  def create
    @vano = Vano.new(params[:vano])

    respond_to do |format|
      if @vano.save
        format.html { redirect_to(@vano, :notice => 'Vano was successfully created.') }
        format.xml  { render :xml => @vano, :status => :created, :location => @vano }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vanos/1
  # PUT /vanos/1.xml
  def update
    @vano = Vano.find(params[:id])

    respond_to do |format|
      if @vano.update_attributes(params[:vano])
        format.html { redirect_to(@vano, :notice => 'Vano was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vanos/1
  # DELETE /vanos/1.xml
  def destroy
    @vano = Vano.find(params[:id])
    @vano.destroy

    respond_to do |format|
      format.html { redirect_to(vanos_url) }
      format.xml  { head :ok }
    end
  end
  
end
