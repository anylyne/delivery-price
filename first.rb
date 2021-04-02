require './lib/reader'
require './lib/price_calculator'

params = {
  from_postcode: 2000,
  to_postcode: 3000,
  length: 22, 
  width: 16,
  height: 7.7,
  weight:1.5,
  service_code: 'AUS_PARCEL_REGULAR'
}

response = PriceCalculator.new.run(params)
puts response['total_cost']
puts response['delivery_time']
