class Stock < ActiveRecord::Base
  # Associations
  has_many :prices, :as => :priceable
  belongs_to :article, :foreign_key => :article_id, :inverse_of => :stock

  # Attributes
  attr_accessible :quantity

  # Validations
  validates :article_id, :colour_id, :size_id, :quantity, :presence => true
  validates :colour_id, :uniqueness => { :scope => :article_id }
end
