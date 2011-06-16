class CreateTtramos < ActiveRecord::Migration
  def self.up
    create_table :ttramos do |t|
      t.string :tipo

      t.timestamps
    end
    
    Ttramo.create(:tipo=>'Arranque')
    Ttramo.create(:tipo=>'Desvio')
    Ttramo.create(:tipo=>'Terminal')
    Ttramo.create(:tipo=>'Retension')
    Ttramo.create(:tipo=>'Alineacion')
    Ttramo.create(:tipo=>'Especial')
  end

  def self.down
    drop_table :ttramos
  end
end
