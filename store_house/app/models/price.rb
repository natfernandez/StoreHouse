class Price < ActiveRecord::Base
  # Associations
  belongs_to :priceable, :polymorphic => true

  # Attributes
  attr_accessible :date_from, :date_to, :cost_price, :sale_price

  # Validations
  validates :priceable, :presence => true
  validates :date_from, :sale_price, :presence => true
end

