class Vano < ActiveRecord::Base
  belongs_to :proyecto
  has_many :reltramovanos
  has_many :tramos, :through => :reltramovanos
end
