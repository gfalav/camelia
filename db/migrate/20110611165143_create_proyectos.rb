class CreateProyectos < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.string :nombre
      t.string :comitente
      t.string :constructor
      t.string :proyectista
      t.date :fproyecto
      t.string :ubicacion
      t.string :descripcion
      t.string :expediente

      t.timestamps
    end
  end

  def self.down
    drop_table :proyectos
  end
end
