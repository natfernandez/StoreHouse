class Size < ActiveRecord::Base
  # Associations
  belongs_to :colour

  # Attributes
  attr_accessible :description

  # Validations
  validates :description, :colour_id, :presence => true
end
