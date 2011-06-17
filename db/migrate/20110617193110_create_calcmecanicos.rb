class CreateCalcmecanicos < ActiveRecord::Migration
  def self.up
    create_table :calcmecanicos do |t|
      t.integer :vano_id
      t.integer :condclima_id
      t.decimal :tension
      t.decimal :tiro
      t.decimal :flecha_t
      t.decimal :flecha_v
      t.decimal :flecha_h
      t.integer :conductor_id
      t.decimal :temp
      t.decimal :viento
      t.decimal :hielo

      t.timestamps
    end
  end

  def self.down
    drop_table :calcmecanicos
  end
end
