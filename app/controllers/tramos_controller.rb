class TramosController < ApplicationController
  # GET /tramos
  # GET /tramos.xml
  def index
    @tramos = Tramo.where(:proyecto_id=>params[:proyecto_id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tramos }
    end
  end

  def calctramos
    calcula_tramos(params[:proyecto_id].to_i)
    @tramos = Tramo.where(:proyecto_id=>params[:proyecto_id])
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html {render :index}
      format.xml  { render :xml => @tramos }
    end    
  end
  
  #divide la linea en tramos y tipos de piquetes
  def calcula_tramos(proyecto_id)
    proyecto = Proyecto.find(params[:proyecto_id].to_i) 
    retmax = proyecto.retmax
    vmax = proyecto.vmax
    pant = nil
    tant = nil
    
    Tramo.where(:proyecto_id => proyecto_id).each {|t|
      t.reltramovanos.destroy_all
      t.destroy
    }      
    Vano.where(:proyecto_id => proyecto_id).destroy_all
    
    puntos = Punto.where(:proyecto_id => proyecto_id).order(:secuencia)
    n = 0
    m = puntos.count-1
    
    puntos.each {|p|
      if (n==0)
        tramo = Tramo.new
        tramo.ttramo_id = 1 #arranque
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Arranque en " + p.nombre
        tramo.proyecto_id = proyecto_id
        tramo.save
        tant = tramo
        
      elsif (n<m) #desvios intermedios
        vano = Vano.new
        vano.nombre = "Vanos entre " + pant.nombre + ' y ' + p.nombre
        if (p.distancia < vmax)
          vano.vano = p.distancia
        else
          vano.vano = p.distancia / (( p.distancia/vmax).to_i + 1 )
        end 
        vano.proyecto_id = proyecto_id
        vano.conductor_e_id = proyecto.conductor_e_id
        vano.conductor_g_id = proyecto.conductor_g_id
        vano.save
        
        if (p.distancia > retmax)
          tramo = Tramo.new
          tramo.ttramo_id = 4 #retension
          tramo.cantidad = (p.distancia/retmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Retensiones entre " + pant.nombre + ' y ' + p.nombre
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        if (p.distancia > vmax)
          tramo = Tramo.new
          tramo.ttramo_id = 5 #alineacion
          tramo.cantidad =(p.distancia/vmax).to_i - (p.distancia/retmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Alineaciones entre " + pant.nombre + ' y ' + p.nombre
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        tramo = Tramo.new
        tramo.ttramo_id = 2 #desvio
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Desvio en " + p.nombre
        tramo.proyecto_id = proyecto_id
        tramo.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tramo.id
        rel.angulo = 0
        rel.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tant.id
        rel.angulo = pant.angulo
        rel.save
        tant = tramo
        
      else #terminal
        vano = Vano.new
        vano.nombre = "Vanos entre " + pant.nombre + ' y ' + p.nombre 
        if (p.distancia < vmax)
          vano.vano = p.distancia
        else
          vano.vano = p.distancia / (( p.distancia/vmax).to_i + 1 )
        end 
        vano.proyecto_id = proyecto_id
        vano.conductor_e_id = proyecto.conductor_e_id
        vano.conductor_g_id = proyecto.conductor_g_id
        vano.save

        if (p.distancia > retmax)
          tramo = Tramo.new
          tramo.ttramo_id = 4 #retension
          tramo.cantidad = (p.distancia/retmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Retensiones entre " + pant.nombre + ' y ' + p.nombre
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        if (p.distancia > vmax)
          tramo = Tramo.new
          tramo.ttramo_id = 5 #alineacion
          tramo.cantidad =(p.distancia/vmax).to_i - (p.distancia/retmax).to_i
          tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
          tramo.nombre = "Alineaciones entre " + pant.nombre + ' y ' + p.nombre
          tramo.proyecto_id = proyecto_id
          tramo.save
          rel = Reltramovano.new
          rel.vano_id = vano.id
          rel.tramo_id = tramo.id
          rel.angulo = 0
          rel.save
        end
        tramo = Tramo.new
        tramo.ttramo_id = 3 #terminal
        tramo.cantidad = 1
        tramo.secuencia = Tramo.where(:proyecto_id =>proyecto_id).maximum(:secuencia).to_i+10
        tramo.nombre = "Terminal en " + p.nombre
        tramo.proyecto_id = proyecto_id
        tramo.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tramo.id
        rel.angulo = p.angulo
        rel.save
        rel = Reltramovano.new
        rel.vano_id = vano.id
        rel.tramo_id = tant.id
        rel.angulo = pant.angulo
        rel.save
        
      end
      
      n+=1
      pant = p
    }
    
    
  end
  
  
  # GET /tramos/1
  # GET /tramos/1.xml
  def show
    @tramo = Tramo.find(params[:id])
    @proyecto_id = params[:proyecto_id]
    @vanos = @tramo.vanos

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tramo }
    end
  end

  # GET /tramos/new
  # GET /tramos/new.xml
  def new
    @tramo = Tramo.new
    @proyecto_id = params[:proyecto_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tramo }
    end
  end

  # GET /tramos/1/edit
  def edit
    @tramo = Tramo.find(params[:id])
    @proyecto_id = params[:proyecto_id]
  end

  # POST /tramos
  # POST /tramos.xml
  def create
    @tramo = Tramo.new(params[:tramo])

    respond_to do |format|
      if @tramo.save
        format.html { redirect_to(@tramo, :notice => 'Tramo was successfully created.') }
        format.xml  { render :xml => @tramo, :status => :created, :location => @tramo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tramos/1
  # PUT /tramos/1.xml
  def update
    @tramo = Tramo.find(params[:id])

    respond_to do |format|
      if @tramo.update_attributes(params[:tramo])
        format.html { redirect_to(@tramo, :notice => 'Tramo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tramo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tramos/1
  # DELETE /tramos/1.xml
  def destroy
    @tramo = Tramo.find(params[:id])
    @proyecto_id = @tramo.proyecto_id
    @tramo.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>'index',:proyecto_id=>@proyecto_id) }
      format.xml  { head :ok }
    end
  end
end
