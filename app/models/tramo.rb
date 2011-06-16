class Tramo < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :ttramo
  has_many :reltramovanos
  has_many :vanos, :through => :reltramovanos
end
