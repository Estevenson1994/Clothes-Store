require "active_type"

class Voucher < ActiveType::Object
  attribute :id, :string
  attribute :amount, :int
  attribute :min_spend, :int
  attribute :required_item, :string
end
