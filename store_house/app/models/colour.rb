class Colour < ActiveRecord::Base
  # Attributes
  attr_accessible :description

  # Validations
  validates :description, :presence => true
end
