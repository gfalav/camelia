class Zona < ActiveRecord::Base
  has_many :proyectos
  has_many :condclimas
end
