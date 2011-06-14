class CreatePuntos < ActiveRecord::Migration
  def self.up
    create_table :puntos do |t|
      t.integer :proyecto_id
      t.string :nombre
      t.integer :secuencia
      t.decimal :latitud
      t.decimal :longitud
      t.decimal :distancia
      t.decimal :angulo

      t.timestamps
    end
  end

  def self.down
    drop_table :puntos
  end
end
