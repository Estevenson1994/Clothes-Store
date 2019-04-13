require_relative "./product_data"
require_relative "./test_product_data"

if ENV["ENVIRONMENT"] == "test"
  DATA = TEST_PRODUCT_DATA
else
  DATA = PRODUCT_DATA
end
