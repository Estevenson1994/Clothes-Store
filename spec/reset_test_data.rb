require_relative "../data/test_product_data"

RESET_DATA = [{ id: 1, stock: 5 },
              { id: 2, stock: 4 },
              { id: 3, stock: 12 },
              { id: 4, stock: 6 },
              { id: 5, stock: 0 },
              { id: 6, stock: 6 },
              { id: 7, stock: 5 },
              { id: 8, stock: 9 },
              { id: 9, stock: 3 },
              { id: 10, stock: 2 },
              { id: 11, stock: 1 },
              { id: 12, stock: 10 },
              { id: 13, stock: 5 }]

def reset_data
  RESET_DATA.each_with_index do |item, index|
    TEST_PRODUCT_DATA[index][:stock] = item[:stock]
  end
end
