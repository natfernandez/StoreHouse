class Order < ActiveRecord::Base
  # Associations
  has_many :order_line_items, :inverse_of => :order
  belongs_to :contact, :inverse_of => :orders

  # Attributes
  attr_accessible :order_number, :date, :discount, :deliver_date

  # Validations
  validates :contact_id, :order_number, :date, :presence => true
  validates :discount, :numericality => { less_than: 100, only_integer: true }
  validates :order_number, :numericality => { :greater_than => 0, only_integer: true }

  after_initialize :set_defaults

  private
  def set_defaults
    self.discount ||= 0.0
  end
end

