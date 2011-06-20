class Vano < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :conductor_e, :class_name=>'Conductor', :foreign_key=>'conductor_e_id'
  belongs_to :conductor_g, :class_name=>'Conductor', :foreign_key=>'conductor_g_id'
  has_many :reltramovanos
  has_many :tramos, :through => :reltramovanos
  has_many :calcmecanicos, :dependent=>:destroy
  
  
  
  def calcvano
    vano = self
    proyecto = vano.proyecto
    
    Calcmecanico.where(:vano_id=>vano.id).destroy_all
    
    arrtmp = Array.new
    tmax = fmax = tmed = 0
    hconductor = 25 #se asume que todos estan igual
    
    proyecto.zona.condclimas.each {|c|
      flag = 0
      arrtmp = Array.new
      
      pv1 = pvcond(proyecto.zona_id, c.viento, 0, vano.conductor_e.diametro,vano.vano,hconductor)
      ph1 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c.hielo)
      pt1 = Math.sqrt(pv1**2 + (ph1+vano.conductor_e.peso/1000)**2)
      pang1 = Math.atan(pv1 / (vano.conductor_e.peso/1000 + ph1)) / Math::PI * 180
      
      t1 = vano.conductor_e.tmax * vano.conductor_e.seccion
      tmax = t1
      if (c.nombre=="Tmed")
        tmed = t1 / vano.conductor_e.seccion
      end
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
      calc.flecha_h = f1 * Math.sin(pang1 / 180 * Math::PI)
      calc.flecha_v = f1 * Math.cos(pang1 / 180 * Math::PI)
      calc.conductor_id = vano.conductor_e.id
      arrtmp << calc
      
      proyecto.zona.condclimas.each {|c2|
        if (c.id != c2.id)          
          pv2 = pvcond(proyecto.zona_id, c2.viento, 0, vano.conductor_e.diametro,vano.vano,hconductor)
          ph2 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c2.hielo)
          pt2 = Math.sqrt(pv2**2 + (ph2+vano.conductor_e.peso/1000)**2)
          pang2 = Math.atan(pv2 / (vano.conductor_e.peso/1000 + ph2)) / Math::PI * 180
          
          k2 = (k1 + vano.conductor_e.coef_t * c2.temp) * vano.conductor_e.coef_e * vano.conductor_e.seccion
          k3 = vano.vano**2 * pt2**2 * vano.conductor_e.coef_e * vano.conductor_e.seccion / 24
          t2 = newton(k2,k3)
          f2 = vano.vano**2 * pt2 / 8 / t2
          if (c2.nombre=="Tmed")
            tmed = t2 / vano.conductor_e.seccion
          end
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
            calc.flecha_h = f2 * Math.sin(pang2 / 180 * Math::PI)
            calc.flecha_v = f2 * Math.cos(pang2 / 180 * Math::PI)
            calc.conductor_id = vano.conductor_e.id
            arrtmp << calc
          end
        end
      }
      if (flag == 0)
        break
      end
    }
    
    if (tmed > vano.conductor_e.tmed)
      Condclima.where(:zona_id => proyecto.zona_id,:nombre=>'Tmed').each { |c|
        arrtmp = Array.new
        
        pv1 = pvcond(proyecto.zona_id, c.viento, 0, vano.conductor_e.diametro,vano.vano,hconductor)
        ph1 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c.hielo)
        pt1 = Math.sqrt(pv1**2 + (ph1+vano.conductor_e.peso/1000)**2)
        pang1 = Math.atan(pv1 / (vano.conductor_e.peso/1000 + ph1)) / Math::PI * 180
        
        t1 = vano.conductor_e.tmed * vano.conductor_e.seccion
        tmax = t1
        tmed = t1 / vano.conductor_e.seccion
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
        calc.flecha_h = f1 * Math.sin(pang1 / 180 * Math::PI)
        calc.flecha_v = f1 * Math.cos(pang1 / 180 * Math::PI)
        calc.conductor_id = vano.conductor_e.id
        arrtmp << calc
        
        proyecto.zona.condclimas.each {|c2|
          if (c.id != c2.id)          
            pv2 = pvcond(proyecto.zona_id, c2.viento, 0, vano.conductor_e.diametro,vano.vano,hconductor)
            ph2 = phcond(proyecto.zona_id,vano.conductor_e.diametro,c2.hielo)
            pt2 = Math.sqrt(pv2**2 + (ph2+vano.conductor_e.peso/1000)**2)
            pang2 = Math.atan(pv2 / (vano.conductor_e.peso/1000 + ph2)) / Math::PI * 180
            
            k2 = (k1 + vano.conductor_e.coef_t * c2.temp) * vano.conductor_e.coef_e * vano.conductor_e.seccion
            k3 = vano.vano**2 * pt2**2 * vano.conductor_e.coef_e * vano.conductor_e.seccion / 24
            t2 = newton(k2,k3)
            f2 = vano.vano**2 * pt2 / 8 / t2
            if (tmax < t2)
              tmax = t2
            end
            if (fmax < f2)
              fmax = f2
            end
            calc = Calcmecanico.new
            calc.vano_id = vano.id
            calc.condclima_id = c2.id
            calc.temp = c2.temp
            calc.viento = c2.viento
            calc.hielo = c2.hielo
            calc.tension = t2 / vano.conductor_e.seccion
            calc.tiro = t2
            calc.flecha_t = f2
            calc.flecha_h = f2 * Math.sin(pang2 / 180 * Math::PI)
            calc.flecha_v = f2 * Math.cos(pang2 / 180 * Math::PI)
            calc.conductor_id = vano.conductor_e.id
            arrtmp << calc
          end
        }
      }
    end
    arrtmp.each {|a|
      a.save  
    }
    vano.tiromax_e = tmax
    vano.flechamax_e = fmax
    vano.tma_e = tmed
    vano.save
    
    #calcula hilo de guardia
    proyecto.zona.condclimas.each {|c|
      flag = 0
      arrtmp = Array.new
      
      pv1 = pvcond(proyecto.zona_id, c.viento, 0, vano.conductor_g.diametro,vano.vano,hconductor)
      ph1 = phcond(proyecto.zona_id,vano.conductor_g.diametro,c.hielo)
      pt1 = Math.sqrt(pv1**2 + (ph1+vano.conductor_g.peso/1000)**2)
      pang1 = Math.atan(pv1 / (vano.conductor_g.peso/1000 + ph1)) / Math::PI * 180
      
      f1 = Calcmecanico.where(:vano_id=>vano.id, :conductor_id=>vano.conductor_e.id, :condclima_id=>c.id)[0].flecha_t*0.9
      t1 = vano.vano**2 * pt1 / 8 / f1
      tmax = t1
      if (c.nombre=="Tmed")
        tmed = t1 / vano.conductor_g.seccion
      end
      fmax = f1
      
      k1 = vano.vano**2 * pt1**2 / 24 / (t1**2)  - vano.conductor_g.coef_t * c.temp - t1 / vano.conductor_g.coef_e / vano.conductor_g.seccion

      calc = Calcmecanico.new
      calc.vano_id = vano.id
      calc.condclima_id = c.id
      calc.temp = c.temp
      calc.viento = c.viento
      calc.hielo = c.hielo
      calc.tension = t1 / vano.conductor_g.seccion
      calc.tiro = t1
      calc.flecha_t = f1
      calc.flecha_h = f1 * Math.sin(pang1 / 180 * Math::PI)
      calc.flecha_v = f1 * Math.cos(pang1 / 180 * Math::PI)
      calc.conductor_id = vano.conductor_g.id
      arrtmp << calc
      
      proyecto.zona.condclimas.each {|c2|
        if (c.id != c2.id)          
          pv2 = pvcond(proyecto.zona_id, c2.viento, 0, vano.conductor_g.diametro,vano.vano,hconductor)
          ph2 = phcond(proyecto.zona_id,vano.conductor_g.diametro,c2.hielo)
          pt2 = Math.sqrt(pv2**2 + (ph2+vano.conductor_g.peso/1000)**2)
          pang2 = Math.atan(pv2 / (vano.conductor_g.peso/1000 + ph2)) / Math::PI * 180
          
          k2 = (k1 + vano.conductor_g.coef_t * c2.temp) * vano.conductor_g.coef_e * vano.conductor_g.seccion
          k3 = vano.vano**2 * pt2**2 * vano.conductor_g.coef_e * vano.conductor_g.seccion / 24
          t2 = newton(k2,k3)
          f2 = vano.vano**2 * pt2 / 8 / t2
          if (tmax < t2)
            tmax = t2
          end
          if (fmax < f2)
            fmax = f2
          end
          if (c2.nombre=="Tmed")
            tmed = t2 / vano.conductor_g.seccion
          end
          if (f2 > Calcmecanico.where(:vano_id=>vano.id, :conductor_id=>vano.conductor_e.id, :condclima_id=>c.id)[0].flecha_t*0.9)
            flag = 1
            break
          else
            calc = Calcmecanico.new
            calc.vano_id = vano.id
            calc.condclima_id = c2.id
            calc.temp = c2.temp
            calc.viento = c2.viento
            calc.hielo = c2.hielo
            calc.tension = t2 / vano.conductor_g.seccion
            calc.tiro = t2
            calc.flecha_t = f2
            calc.flecha_h = f2 * Math.sin(pang2 / 180 * Math::PI)
            calc.flecha_v = f2 * Math.cos(pang2 / 180 * Math::PI)
            calc.conductor_id = vano.conductor_g.id
            arrtmp << calc
          end
        end
      }
      if (flag == 0)
        break
      end
    }
    arrtmp.each {|a|
      a.save  
    }
    vano.tiromax_g = tmax
    vano.flechamax_g = fmax
    vano.tma_g = tmed
    vano.save
        
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
        if (h_conductor > 20 && h_conductor < 30)
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
                
        pv = k * c * (v/3.6) ** 2 / 16000 * d * q * Math.cos(ang/180*Math::PI)
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
