require "active_type"
require_relative "../voucher_data"

class Voucher < ActiveType::Object
  attribute :id, :string
  attribute :amount, :int
  attribute :min_spend, :int
  attribute :required_item, :string

  def self.find(id)
    if VOUCHERS.any? { |voucher| voucher[:id] == id }
      voucher = VOUCHERS.select { |voucher| voucher[:id] == id }.first
      Voucher.new(id: voucher[:id],
                  amount: voucher[:amount],
                  min_spend: voucher[:min_spend],
                  required_item: voucher[:required_item])
    else
      raise "Invalid voucher id"
    end
  end
end
