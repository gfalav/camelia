class AddVariosToProyecto < ActiveRecord::Migration
  def self.up
    add_column :proyectos, :conductor_e_id, :integer
    add_column :proyectos, :conductor_g_id, :integer
    add_column :proyectos, :zona_id, :integer
    add_column :proyectos, :tconstructivo_id, :integer
    add_column :proyectos, :vmax, :float
    add_column :proyectos, :retmax, :float
  end

  def self.down
    remove_column :proyectos, :retmax
    remove_column :proyectos, :vmax
    remove_column :proyectos, :tconstructivo_id
    remove_column :proyectos, :zona_id
    remove_column :proyectos, :conductor_g_id
    remove_column :proyectos, :conductor_e_id
  end
end
