class OrderLineItem < ActiveRecord::Base
  # Associations
  belongs_to :order, :foreign_key => :order_id, :inverse_of => :order_line_items, autosave: true


  # Attributes
  attr_accessible :order_id, :article_id, :colour, :size, :price, :quantity

  # Validations
  validates :colour, :size, :price, :quantity, :presence => true
end

