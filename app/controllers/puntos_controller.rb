class PuntosController < ApplicationController
  
  def indajax
    if (params[:lat]!=nil && params[:long]!=nil)
      newpunto = Punto.new
      newpunto.latitud = params[:lat].to_f
      newpunto.longitud = params[:long].to_f
      newpunto.proyecto_id = params[:proyecto_id].to_i
      newpunto.secuencia = Punto.where(:proyecto_id => params[:proyecto_id]).maximum(:secuencia).to_i + 10 
      newpunto.nombre = "Punto " + newpunto.secuencia.to_s
      newpunto.distancia = 0
      newpunto.angulo = 0
      newpunto.save
    end
    
    @puntosarr = calcdistang(params[:proyecto_id])
    
    render :json => @puntosarr.to_json
        
  end
  
  def calcdistang(proyecto_id)
    puntosarr = Punto.where(:proyecto_id=>proyecto_id).order('secuencia')
    p1 = nil
    p2 = nil
    p3 = nil
    
    puntosarr.each {|p|
      if (p1==nil)
        p1 = p
      elsif (p2==nil)
        p2 = p1
        p1 = p
        x1 = (p2.longitud - p1.longitud) * 60 * 1852 * Math.cos(p1.latitud * Math::PI / 180)
        y1 = (p2.latitud - p1.latitud) * 60 * 1852
        p1.distancia = Math.sqrt(x1*x1 + y1 * y1)
        p1.save 
      else
        p3 = p2
        p2 = p1
        p1 = p
        
        x1 = (p2.longitud - p1.longitud) * 60 * 1852 * Math.cos(p1.latitud * Math::PI / 180)
        y1 = (p2.latitud - p1.latitud) * 60 * 1852
        ang1 = Math.atan2(y1, x1) * 180 / Math::PI
    
        x2 = (p2.longitud - p3.longitud) * 60 * 1852 * Math.cos(p2.latitud * Math::PI / 180)
        y2 = (p2.latitud - p3.latitud) * 60 * 1852
        ang2 = Math.atan2(y2, x2) * 180 / Math::PI
    
        ang = (ang1 - ang2).abs
        if (ang > 180)
           ang = 360 - ang
        end

        p1.distancia = Math.sqrt(x1*x1 + y1 * y1)
        p1.save 
        p2.distancia = Math.sqrt(x2*x2 + y2*y2)
        p2.angulo = ang
        p2.save
                
      end      
    }

    return puntosarr
    
  end
  
  # GET /puntos
  # GET /puntos.xml
  def index
    @puntos = calcdistang(params[:proyecto_id])
    @puntosarr = @puntos.to_json
    @proyecto_id = params[:proyecto_id]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @puntos }
    end
  end

  # GET /puntos/1
  # GET /puntos/1.xml
  def show
    
    @punto = Punto.find(params[:id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @punto }
    end
  end

  # GET /puntos/new
  # GET /puntos/new.xml
  def new
    @punto = Punto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @punto }
    end
  end

  # GET /puntos/1/edit
  def edit
    @punto = Punto.find(params[:id])
    @proyecto_id = params[:proyecto_id]
  end

  # POST /puntos
  # POST /puntos.xml
  def create
    @punto = Punto.new(params[:punto])

    respond_to do |format|
      if @punto.save
        format.html { redirect_to(@punto, :notice => 'Punto was successfully created.') }
        format.xml  { render :xml => @punto, :status => :created, :location => @punto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @punto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /puntos/1
  # PUT /puntos/1.xml
  def update
    @punto = Punto.find(params[:id])

    respond_to do |format|
      if @punto.update_attributes(params[:punto])
        format.html { redirect_to(@punto, :notice => 'Punto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @punto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /puntos/1
  # DELETE /puntos/1.xml
  def destroy
    @punto = Punto.find(params[:id])
    @proyecto_id = @punto.proyecto_id
    @punto.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>'index',:proyecto_id=>@proyecto_id) }
      format.xml  { head :ok }
    end
  end
end
