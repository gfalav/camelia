class CalcmecanicosController < ApplicationController
  # GET /calcmecanicos
  # GET /calcmecanicos.xml
  def index
    @calcmecanicos = Calcmecanico.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calcmecanicos }
    end
  end

  # GET /calcmecanicos/1
  # GET /calcmecanicos/1.xml
  def show
    @calcmecanico = Calcmecanico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calcmecanico }
    end
  end

  # GET /calcmecanicos/new
  # GET /calcmecanicos/new.xml
  def new
    @calcmecanico = Calcmecanico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calcmecanico }
    end
  end

  # GET /calcmecanicos/1/edit
  def edit
    @calcmecanico = Calcmecanico.find(params[:id])
  end

  # POST /calcmecanicos
  # POST /calcmecanicos.xml
  def create
    @calcmecanico = Calcmecanico.new(params[:calcmecanico])

    respond_to do |format|
      if @calcmecanico.save
        format.html { redirect_to(@calcmecanico, :notice => 'Calcmecanico was successfully created.') }
        format.xml  { render :xml => @calcmecanico, :status => :created, :location => @calcmecanico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calcmecanico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calcmecanicos/1
  # PUT /calcmecanicos/1.xml
  def update
    @calcmecanico = Calcmecanico.find(params[:id])

    respond_to do |format|
      if @calcmecanico.update_attributes(params[:calcmecanico])
        format.html { redirect_to(@calcmecanico, :notice => 'Calcmecanico was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calcmecanico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calcmecanicos/1
  # DELETE /calcmecanicos/1.xml
  def destroy
    @calcmecanico = Calcmecanico.find(params[:id])
    @calcmecanico.destroy

    respond_to do |format|
      format.html { redirect_to(calcmecanicos_url) }
      format.xml  { head :ok }
    end
  end
end
