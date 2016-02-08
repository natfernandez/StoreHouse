class Price < ActiveRecord::Base
  # Associations
  belongs_to :priceable, :polymorphic => true

  # Attributes
  attr_accessible :date_from, :date_to, :amount

  # Validations
  validates :priceable, :presence => true
  validates :date_from, :presence => true
  validates :amount, :presence => true

  after_initialize :set_default

  private
  def set_default
    self.date_from ||= Date.today if new_record?
  end
end
