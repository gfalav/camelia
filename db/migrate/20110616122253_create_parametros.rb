class CreateParametros < ActiveRecord::Migration
  def self.up
    create_table :parametros do |t|
      t.string :radical
      t.string :nombre
      t.string :desc
      t.float :valor

      t.timestamps
    end
    
    Parametro.create(:radical=>'vmax', :nombre=>'Vano max', :valor=>280)
    Parametro.create(:radical=>'retmax', :nombre=>'Dist max entre retensiones', :valor=>3000)
  end

  def self.down
    drop_table :parametros
  end
end
