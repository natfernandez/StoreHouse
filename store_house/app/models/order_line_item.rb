class OrderLineItem < ActiveRecord::Base
  # Associations
  belongs_to :order, :foreign_key => :order_id, :inverse_of => :order_line_item


  # Attributes
  attr_accessible :colour, :size, :price, :quantity

  # Validations
  validates :colour, :size, :price, :quantity, :presence => true
end

