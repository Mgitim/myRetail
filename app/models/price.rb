class Price
  include Mongoid::Document
  include Mongoid::Timestamps
  field :product_id, type: Integer
  field :currency_code, type: String
  field :value, type: BigDecimal
end
