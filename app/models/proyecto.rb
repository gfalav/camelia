class Proyecto < ActiveRecord::Base
  has_many :puntos
  has_many :tramos
  has_many :vanos
end
