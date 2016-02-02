class Price < ActiveRecord::Base
  # Associations
  belongs_to :stock, :foreign_key => :stock_id, :inverse_of => :price

  # Attributes
  attr_accessible :date_from, :date_to, :cost_price, :sale_price

  # Validations
  validates :date_from, :sale_price, :presence => true
end

