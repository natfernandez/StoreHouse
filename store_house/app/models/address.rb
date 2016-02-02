class Address < ActiveRecord::Base
  # Associations
  belongs_to :addressable, :polymorphic => true

  # Attributes
  attr_accessible :line_1, :line_2, :line_3, :line_4, :post_code

  # Validations
  validates :addressable, :presence => true
  validates :line_1, :line_2, line_3, line_4, :length => { :maximum => 50 }
  validates :post_code, :length => { :maximum => 9 }
end
