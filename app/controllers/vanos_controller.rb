class VanosController < ApplicationController
  
  def calcvano
    vano = Vano.find(params[:vano])
    tramo = Tramo.find(params[:tramo])
    angulo = Reltramovano.where(:vano_id=>vano.id,:tramo_id=>tramo.id)[0].angulo
    proyecto = vano.proyecto
    
    arrtmp = Array.new
    tmax = fmax = 0
    
    proyecto.zona.condclimas.each {|c|
      flag = 0
      arrtmp = Array.new
      
      pv1 = pvcond(proyecto.zona_id, c.viento, angulo, vano.conductor_e.diametro,vano.vano,25)
      ph1 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c.hielo)
      pt1 = Math.sqrt(pv1**2 + (ph1+vano.conductor_e.peso/1000)**2)
      pang1 = Math.atan(pv1 / (vano.conductor_e.peso/1000 + ph1)) / Math::PI * 180
      
      t1 = vano.conductor_e.tmax * vano.conductor_e.seccion
      tmax = t1
      f1 = vano.vano**2 * pt1 / 8 / t1
      fmax = f1
      
      k1 = vano.vano**2 * pt1**2 / 24 / (t1**2)  - vano.conductor_e.coef_t * c.temp - t1 / vano.conductor_e.coef_e / vano.conductor_e.seccion

      calc = Calcmecanico.new
      calc.vano_id = vano.id
      calc.condclima_id = c.id
      calc.temp = c.temp
      calc.viento = c.viento
      calc.hielo = c.hielo
      calc.tension = t1 / vano.conductor_e.seccion
      calc.tiro = t1
      calc.flecha_t = f1
      calc.flecha_v = f1 * Math.sin(pang1 / 180 * Math::PI)
      calc.flecha_h = f1 * Math.cos(pang1 / 180 * Math::PI)
      calc.conductor_id = vano.conductor_e.id
      calc.save
      arrtmp << calc
      
      proyecto.zona.condclimas.each {|c2|
        if (c.id != c2.id)          
          pv2 = pvcond(proyecto.zona_id, c2.viento, angulo, vano.conductor_e.diametro,vano.vano,25)
          ph2 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c2.hielo)
          pt2 = Math.sqrt(pv2**2 + (ph2+vano.conductor_e.peso/1000)**2)
          pang2 = Math.atan(pv2 / (vano.conductor_e.peso/1000 + ph2)) / Math::PI * 180
          
          k2 = (k1 + vano.conductor_e.coef_t * c2.temp) * vano.conductor_e.coef_e * vano.conductor_e.seccion
          k3 = vano.vano**2 * pt2**2 * vano.conductor_e.coef_e * vano.conductor_e.seccion / 24
          t2 = newton(k2,k3)
          f2 = vano.vano**2 * pt2 / 8 / t2
          
          if (t2 > t1)
            flag = 1
            break
          else
            calc = Calcmecanico.new
            calc.vano_id = vano.id
            calc.condclima_id = c2.id
            calc.temp = c2.temp
            calc.viento = c2.viento
            calc.hielo = c2.hielo
            calc.tension = t2 / vano.conductor_e.seccion
            calc.tiro = t2
            calc.flecha_t = f2
            calc.flecha_v = f2 * Math.sin(pang2 / 180 * Math::PI)
            calc.flecha_h = f2 * Math.cos(pang2 / 180 * Math::PI)
            calc.conductor_id = vano.conductor_e.id
            calc.save
            arrtmp << calc
          end
        end
      }
      if (flag == 0)
        break
      end
    }
    
    render :text => 'tmax: ' + tmax.to_s + ' fmax: ' + fmax.to_s
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
  
  def newton(k2,k3)
    n=0
    x0 = 0.01
    
    while (n < 500) do
      x = x0 - (x0**3 + k2 * x0**2 - k3) / (3 * x0**2 + 2 * k2 * x0);
      x0 = x;
      n += 1;
    end
    
    return x    
  end
end
