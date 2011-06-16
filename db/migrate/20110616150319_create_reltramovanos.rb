class CreateReltramovanos < ActiveRecord::Migration
  def self.up
    create_table :reltramovanos do |t|
      t.integer :tramo_id
      t.integer :vano_id
      t.float :angulo

      t.timestamps
    end
  end

  def self.down
    drop_table :reltramovanos
  end
end
