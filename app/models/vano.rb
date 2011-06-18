class Vano < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :conductor_e, :class_name=>'Conductor', :foreign_key=>'conductor_e_id'
  belongs_to :conductor_g, :class_name=>'Conductor', :foreign_key=>'conductor_g_id'
  has_many :reltramovanos
  has_many :tramos, :through => :reltramovanos
  has_many :calcmecanicos, :dependent=>:destroy
end
