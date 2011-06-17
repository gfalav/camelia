class CondclimasController < ApplicationController
  # GET /condclimas
  # GET /condclimas.xml
  def index
    @condclimas = Condclima.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @condclimas }
    end
  end

  # GET /condclimas/1
  # GET /condclimas/1.xml
  def show
    @condclima = Condclima.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @condclima }
    end
  end

  # GET /condclimas/new
  # GET /condclimas/new.xml
  def new
    @condclima = Condclima.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @condclima }
    end
  end

  # GET /condclimas/1/edit
  def edit
    @condclima = Condclima.find(params[:id])
  end

  # POST /condclimas
  # POST /condclimas.xml
  def create
    @condclima = Condclima.new(params[:condclima])

    respond_to do |format|
      if @condclima.save
        format.html { redirect_to(@condclima, :notice => 'Condclima was successfully created.') }
        format.xml  { render :xml => @condclima, :status => :created, :location => @condclima }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @condclima.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /condclimas/1
  # PUT /condclimas/1.xml
  def update
    @condclima = Condclima.find(params[:id])

    respond_to do |format|
      if @condclima.update_attributes(params[:condclima])
        format.html { redirect_to(@condclima, :notice => 'Condclima was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @condclima.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /condclimas/1
  # DELETE /condclimas/1.xml
  def destroy
    @condclima = Condclima.find(params[:id])
    @condclima.destroy

    respond_to do |format|
      format.html { redirect_to(condclimas_url) }
      format.xml  { head :ok }
    end
  end
end
