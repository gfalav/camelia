class Proyecto < ActiveRecord::Base
  belongs_to :zona
  belongs_to :conductor_e, :class_name=>'Conductor', :foreign_key=>'conductor_e_id'
  belongs_to :conductor_g, :class_name=>'Conductor', :foreign_key=>'conductor_g_id'
  has_many :puntos
  has_many :tramos
  has_many :vanos
end
