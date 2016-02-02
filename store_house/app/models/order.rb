class Order < ActiveRecord::Base
  # Associations
  has_many :order_line_items, :inverse_of => :order
  belongs_to :customer, :inverse_of => :order

  # Attributes
  attr_accessible :order_number, :date, :discount, :deliver_date

  # Validations
  validates :customer_id, :order_number, :date, :presence => true
  validates :discount, :numericality => { less_than: 100, only_integer: true }
end

