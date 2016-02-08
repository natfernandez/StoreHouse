class Colour < ActiveRecord::Base
  # Associations
  has_many :sizes

  # Attributes
  attr_accessible :description

  # Validations
  validates :description, :presence => true
end
