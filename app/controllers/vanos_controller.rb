class VanosController < ApplicationController
  
  def calcvano
    debugger
    vano = Vano.find(params[:vano])
    tramo = Tramo.find(params[:tramo])
    proyecto = vano.proyecto
    
    proyecto.zona.condclimas.each {|c|
      flag = 0
      
      pv1 = pvcond(proyecto.zona_id, c.viento, tramo.angulo, vano.conductor_e.diametro,vano.vano,25)
      ph1 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c.hielo)
      pt1 = Math.sqrt(pv1**2 + (ph1+vano.conductor_e.peso/1000)**2)
    }
  end
  
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
  
  def pvcond(zona_id,v,ang,d,vano,h_conductor)
    case zona_id
      when 6
        if (v != 0)
          pv = 0.05 * d
        else
          pv = 0
        end
      else 
        if (v <= 110)
          k = 0.85
        else 
          k = 0.75
        end
        if (vano > 200)
          q = 0.6 + 80 / vano
        else
          q = 1
        end
        if (h_conductor >20 && h_conductor < 30)
          v = v * 1.05
        elsif (h_conductor > 30)
          v = v * Math.sqrt(0.8 + alt_conductor/100)
        end
        if (d<12.5)
          c = 1.2
        elsif (d<15.8)
          c = 1.1
        else
          c = 1
        end
                
        pv = k * c * (v/3.6) ** 2 / 16000 * d * q * Math.sin(ang/180*Math::PI)
    end
    
    return pv
  end
  
  def phcond(zona_id,d,e)
    case zona_id 
      when 6 
        if (e != 0)
          ph = 0.18 * Math.sqrt(d)
        else 
          ph = 0
        end
      else
        ph = 0.0029845 * e * (e + d)
    end
    
    return ph
  end
  
  
end
