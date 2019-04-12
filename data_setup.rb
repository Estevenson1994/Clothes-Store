require "./product_data"
require "./test_product_data"

if ENV["ENVIRONMENT"] == "test"
  DATA = TEST_PRODUCT_DATA
else
  DATA = PRODUCT_DATA
end
