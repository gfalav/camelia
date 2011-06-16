class TtramosController < ApplicationController
  # GET /ttramos
  # GET /ttramos.xml
  def index
    @ttramos = Ttramo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ttramos }
    end
  end

  # GET /ttramos/1
  # GET /ttramos/1.xml
  def show
    @ttramo = Ttramo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ttramo }
    end
  end

  # GET /ttramos/new
  # GET /ttramos/new.xml
  def new
    @ttramo = Ttramo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ttramo }
    end
  end

  # GET /ttramos/1/edit
  def edit
    @ttramo = Ttramo.find(params[:id])
  end

  # POST /ttramos
  # POST /ttramos.xml
  def create
    @ttramo = Ttramo.new(params[:ttramo])

    respond_to do |format|
      if @ttramo.save
        format.html { redirect_to(@ttramo, :notice => 'Ttramo was successfully created.') }
        format.xml  { render :xml => @ttramo, :status => :created, :location => @ttramo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ttramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ttramos/1
  # PUT /ttramos/1.xml
  def update
    @ttramo = Ttramo.find(params[:id])

    respond_to do |format|
      if @ttramo.update_attributes(params[:ttramo])
        format.html { redirect_to(@ttramo, :notice => 'Ttramo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ttramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ttramos/1
  # DELETE /ttramos/1.xml
  def destroy
    @ttramo = Ttramo.find(params[:id])
    @ttramo.destroy

    respond_to do |format|
      format.html { redirect_to(ttramos_url) }
      format.xml  { head :ok }
    end
  end
end
