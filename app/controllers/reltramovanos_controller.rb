class ReltramovanosController < ApplicationController
  # GET /reltramovanos
  # GET /reltramovanos.xml
  def index
    @reltramovanos = Reltramovano.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reltramovanos }
    end
  end

  # GET /reltramovanos/1
  # GET /reltramovanos/1.xml
  def show
    @reltramovano = Reltramovano.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reltramovano }
    end
  end

  # GET /reltramovanos/new
  # GET /reltramovanos/new.xml
  def new
    @reltramovano = Reltramovano.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reltramovano }
    end
  end

  # GET /reltramovanos/1/edit
  def edit
    @reltramovano = Reltramovano.find(params[:id])
  end

  # POST /reltramovanos
  # POST /reltramovanos.xml
  def create
    @reltramovano = Reltramovano.new(params[:reltramovano])

    respond_to do |format|
      if @reltramovano.save
        format.html { redirect_to(@reltramovano, :notice => 'Reltramovano was successfully created.') }
        format.xml  { render :xml => @reltramovano, :status => :created, :location => @reltramovano }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reltramovano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reltramovanos/1
  # PUT /reltramovanos/1.xml
  def update
    @reltramovano = Reltramovano.find(params[:id])

    respond_to do |format|
      if @reltramovano.update_attributes(params[:reltramovano])
        format.html { redirect_to(@reltramovano, :notice => 'Reltramovano was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reltramovano.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reltramovanos/1
  # DELETE /reltramovanos/1.xml
  def destroy
    @reltramovano = Reltramovano.find(params[:id])
    @reltramovano.destroy

    respond_to do |format|
      format.html { redirect_to(reltramovanos_url) }
      format.xml  { head :ok }
    end
  end
end
