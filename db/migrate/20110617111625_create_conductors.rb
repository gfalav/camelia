class CreateConductors < ActiveRecord::Migration
  def self.up
    create_table :conductors do |t|
      t.string :nombre
      t.decimal :diametro
      t.decimal :seccion
      t.decimal :peso
      t.decimal :rmec
      t.decimal :coef_e
      t.decimal :coef_t
      t.decimal :imax
      t.decimal :relec
      t.decimal :tmax
      t.decimal :tmed

      t.timestamps
    end
    
    Conductor.create(:nombre=>'Al Ac - 16/2.5',:seccion=>17.813,:diametro=>5.4,:peso=>62,:rmec=>580,:coef_e=>8100,:coef_t=>0.0000191,:imax=>90,:relec=>1.88,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 24/4',:seccion=>27.833,:diametro=>6.75,:peso=>97,:rmec=>900,:coef_e=>8100,:coef_t=>0.0000191,:imax=>125,:relec=>1.2,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 35/6',:seccion=>40.079,:diametro=>8.1,:peso=>139,:rmec=>1230,:coef_e=>8100,:coef_t=>0.0000191,:imax=>145,:relec=>0.835,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 50/8',:seccion=>56.297,:diametro=>9.6,:peso=>196,:rmec=>1680,:coef_e=>8100,:coef_t=>0.0000191,:imax=>170,:relec=>0.595,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 70/12',:seccion=>81.289,:diametro=>11.72,:peso=>286,:rmec=>2630,:coef_e=>7700,:coef_t=>0.0000189,:imax=>290,:relec=>0.413,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 95/15',:seccion=>109.726,:diametro=>13.61,:peso=>386,:rmec=>3490,:coef_e=>7700,:coef_t=>0.0000189,:imax=>350,:relec=>0.306,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 120/20',:seccion=>141.422,:diametro=>15.46,:peso=>497,:rmec=>4440,:coef_e=>7700,:coef_t=>0.0000189,:imax=>410,:relec=>0.237,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 150/25',:seccion=>173.11,:diametro=>17.1,:peso=>609,:rmec=>5360,:coef_e=>7700,:coef_t=>0.0000189,:imax=>470,:relec=>0.194,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 185/30',:seccion=>213.63,:diametro=>18.99,:peso=>750,:rmec=>6520,:coef_e=>7700,:coef_t=>0.0000189,:imax=>535,:relec=>0.157,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 210/35',:seccion=>243.191,:diametro=>20.27,:peso=>855,:rmec=>7340,:coef_e=>7700,:coef_t=>0.0000189,:imax=>590,:relec=>0.138,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 240/40',:seccion=>282.541,:diametro=>21.84,:peso=>992,:rmec=>8510,:coef_e=>7700,:coef_t=>0.0000189,:imax=>645,:relec=>0.119,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 300/50',:seccion=>353.735,:diametro=>24.5,:peso=>1227,:rmec=>10500,:coef_e=>7700,:coef_t=>0.0000189,:imax=>740,:relec=>0.095,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 340/30',:seccion=>369.139,:diametro=>24.99,:peso=>1181,:rmec=>9160,:coef_e=>6200,:coef_t=>0.0000209,:imax=>790,:relec=>0.085,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 380/50',:seccion=>431.184,:diametro=>27,:peso=>1458,:rmec=>12100,:coef_e=>7000,:coef_t=>0.0000193,:imax=>840,:relec=>0.076,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 435/55',:seccion=>490.591,:diametro=>28.8,:peso=>1658,:rmec=>13300,:coef_e=>7000,:coef_t=>0.0000193,:imax=>900,:relec=>0.067,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 550/70',:seccion=>620.904,:diametro=>32.4,:peso=>2099,:rmec=>16000,:coef_e=>7000,:coef_t=>0.0000193,:imax=>1020,:relec=>0.053,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Ac - 680/85',:seccion=>764.538,:diametro=>36,:peso=>2572,:rmec=>20600,:coef_e=>6800,:coef_t=>0.0000194,:imax=>1150,:relec=>0.043,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 16/2.5',:seccion=>17.813,:diametro=>5.4,:peso=>62,:rmec=>760,:coef_e=>8100,:coef_t=>0.0000191,:imax=>90,:relec=>2.19,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 24/4',:seccion=>27.833,:diametro=>6.75,:peso=>97,:rmec=>1180,:coef_e=>8100,:coef_t=>0.0000191,:imax=>125,:relec=>1.4,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 35/6',:seccion=>40.079,:diametro=>8.1,:peso=>139,:rmec=>1680,:coef_e=>8100,:coef_t=>0.0000191,:imax=>145,:relec=>0.97,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 50/8',:seccion=>56.297,:diametro=>9.6,:peso=>196,:rmec=>2350,:coef_e=>8100,:coef_t=>0.0000191,:imax=>170,:relec=>0.691,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 70/12',:seccion=>81.289,:diametro=>11.72,:peso=>286,:rmec=>3440,:coef_e=>7700,:coef_t=>0.0000189,:imax=>290,:relec=>0.468,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 95/15',:seccion=>109.726,:diametro=>13.61,:peso=>386,:rmec=>4630,:coef_e=>7700,:coef_t=>0.0000189,:imax=>350,:relec=>0.355,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 120/20',:seccion=>141.422,:diametro=>15.46,:peso=>497,:rmec=>5980,:coef_e=>7700,:coef_t=>0.0000189,:imax=>410,:relec=>0.276,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 150/25',:seccion=>173.11,:diametro=>17.1,:peso=>609,:rmec=>7310,:coef_e=>7700,:coef_t=>0.0000189,:imax=>470,:relec=>0.225,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 185/30',:seccion=>213.63,:diametro=>18.99,:peso=>750,:rmec=>8940,:coef_e=>7700,:coef_t=>0.0000189,:imax=>535,:relec=>0.182,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 210/35',:seccion=>243.191,:diametro=>20.27,:peso=>855,:rmec=>10200,:coef_e=>7700,:coef_t=>0.0000189,:imax=>590,:relec=>0.16,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 240/40',:seccion=>282.541,:diametro=>21.84,:peso=>992,:rmec=>11800,:coef_e=>7700,:coef_t=>0.0000189,:imax=>645,:relec=>0.138,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 300/50',:seccion=>353.735,:diametro=>24.44,:peso=>1243,:rmec=>14800,:coef_e=>7700,:coef_t=>0.0000189,:imax=>740,:relec=>0.11,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 340/30',:seccion=>369.139,:diametro=>24.99,:peso=>1181,:rmec=>13500,:coef_e=>6200,:coef_t=>0.0000209,:imax=>790,:relec=>0.098,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 380/50',:seccion=>431.184,:diametro=>27,:peso=>1458,:rmec=>17100,:coef_e=>7000,:coef_t=>0.0000193,:imax=>840,:relec=>0.088,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 435/55',:seccion=>490.591,:diametro=>28.8,:peso=>1658,:rmec=>19300,:coef_e=>7000,:coef_t=>0.0000193,:imax=>900,:relec=>0.077,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 550/70',:seccion=>620.904,:diametro=>32.4,:peso=>2099,:rmec=>24500,:coef_e=>7000,:coef_t=>0.0000193,:imax=>1020,:relec=>0.061,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al Ac - 680/85',:seccion=>764.538,:diametro=>36,:peso=>2572,:rmec=>30000,:coef_e=>6800,:coef_t=>0.0000194,:imax=>1150,:relec=>0.05,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 10',:seccion=>10.02,:diametro=>4.05,:peso=>27,:rmec=>280,:coef_e=>6000,:coef_t=>0.000023,:imax=>65,:relec=>3.32,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 16',:seccion=>15.889,:diametro=>5.1,:peso=>43,:rmec=>444,:coef_e=>6000,:coef_t=>0.000023,:imax=>100,:relec=>2.09,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 25',:seccion=>25.414,:diametro=>6.45,:peso=>69,:rmec=>710,:coef_e=>6000,:coef_t=>0.000023,:imax=>125,:relec=>1.31,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 35',:seccion=>34.913,:diametro=>7.56,:peso=>95,:rmec=>976,:coef_e=>6000,:coef_t=>0.000023,:imax=>160,:relec=>0.952,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 50',:seccion=>50.142,:diametro=>9.06,:peso=>137,:rmec=>1401,:coef_e=>6000,:coef_t=>0.000023,:imax=>195,:relec=>0.663,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 50',:seccion=>51.072,:diametro=>9.25,:peso=>140,:rmec=>1427,:coef_e=>5700,:coef_t=>0.000023,:imax=>195,:relec=>0.654,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 70',:seccion=>68.98,:diametro=>10.75,:peso=>189,:rmec=>1928,:coef_e=>5700,:coef_t=>0.000023,:imax=>235,:relec=>0.484,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 95',:seccion=>94.764,:diametro=>12.6,:peso=>260,:rmec=>2648,:coef_e=>5700,:coef_t=>0.000023,:imax=>300,:relec=>0.352,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 120',:seccion=>121.209,:diametro=>14.25,:peso=>331,:rmec=>3387,:coef_e=>5700,:coef_t=>0.000023,:imax=>340,:relec=>0.275,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 120',:seccion=>134.329,:diametro=>15.05,:peso=>368,:rmec=>3755,:coef_e=>5700,:coef_t=>0.000023,:imax=>340,:relec=>0.249,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 150',:seccion=>147.115,:diametro=>15.75,:peso=>403,:rmec=>4111,:coef_e=>5700,:coef_t=>0.000023,:imax=>395,:relec=>0.227,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 185',:seccion=>184.541,:diametro=>17.64,:peso=>506,:rmec=>5157,:coef_e=>5700,:coef_t=>0.000023,:imax=>455,:relec=>0.181,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 240',:seccion=>236.038,:diametro=>19.95,:peso=>648,:rmec=>6596,:coef_e=>5700,:coef_t=>0.000023,:imax=>545,:relec=>0.142,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 240',:seccion=>242.541,:diametro=>20.25,:peso=>667,:rmec=>6778,:coef_e=>5500,:coef_t=>0.000023,:imax=>545,:relec=>0.138,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 300',:seccion=>304.243,:diametro=>22.68,:peso=>835,:rmec=>8501,:coef_e=>5500,:coef_t=>0.000023,:imax=>625,:relec=>0.11,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Al Al - 400',:seccion=>389.143,:diametro=>25.65,:peso=>1068,:rmec=>10874,:coef_e=>5500,:coef_t=>0.000023,:imax=>725,:relec=>0.086,:tmax=>8,:tmed=>6.5)
    Conductor.create(:nombre=>'Espanol - 180',:seccion=>181.6,:diametro=>17.5,:peso=>676,:rmec=>6630,:coef_e=>8200,:coef_t=>0.0000178,:imax=>100,:relec=>0,:tmax=>12,:tmed=>6.5)
    Conductor.create(:nombre=>'Acero 25',:seccion=>23.37,:diametro=>6.3,:peso=>189,:rmec=>2629,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    Conductor.create(:nombre=>'Acero 35',:seccion=>33.63,:diametro=>7.5,:peso=>269,:rmec=>3783,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    Conductor.create(:nombre=>'Acero 50',:seccion=>48.26,:diametro=>9,:peso=>394,:rmec=>5429,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    Conductor.create(:nombre=>'Acero 65',:seccion=>65.74,:diametro=>10.5,:peso=>527,:rmec=>7396,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    Conductor.create(:nombre=>'Acero 95',:seccion=>93.29,:diametro=>12.5,:peso=>754,:rmec=>10495,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    Conductor.create(:nombre=>'Acero 120',:seccion=>117.04,:diametro=>14.5,:peso=>943,:rmec=>13167,:coef_e=>18500,:coef_t=>0.0000115,:imax=>0,:relec=>0,:tmax=>35,:tmed=>35)
    
  end

  def self.down
    drop_table :conductors
  end
end
