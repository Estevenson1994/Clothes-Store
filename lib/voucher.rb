require "active_type"
require_relative "../voucher_data"

class Voucher < ActiveType::Object
  attribute :id, :string
  attribute :amount, :int
  attribute :min_spend, :int
  attribute :required_item, :string

  def self.find(id)
    raise "Invalid voucher id" unless voucher_exists(id)
    return_voucher(id)
  end

  def self.voucher_exists(id)
    VOUCHERS.any? { |voucher| voucher[:id] == id }
  end

  def self.return_voucher(id)
    voucher = VOUCHERS.select { |voucher| voucher[:id] == id }.first
    Voucher.new(id: voucher[:id],
                amount: voucher[:amount],
                min_spend: voucher[:min_spend],
                required_item: voucher[:required_item])
  end
end
