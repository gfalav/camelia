class CreateTramos < ActiveRecord::Migration
  def self.up
    create_table :tramos do |t|
      t.integer :ttramo_id
      t.integer :secuencia
      t.string  :nombre
      t.integer :cantidad
      t.integer :proyecto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tramos
  end
end
