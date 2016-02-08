class Size < ActiveRecord::Base

  # Attributes
  attr_accessible :description

  # Validations
  validates :description, :presence => true
  validates :type, :presence => true
end
