class Price
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_id, type: Integer
  field :currency_code, type: String
  field :value, type: BigDecimal
  CURRENCY_CODES = %w[USD]
  validates :value, numericality: { greater_than_or_equal_to: 0.0 }
  validates :currency_code, inclusion: { in: CURRENCY_CODES }
end
