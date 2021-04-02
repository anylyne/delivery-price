require './lib/reader'
require './lib/writer'
require './lib/price_calculator'

reader = Reader.new('./files/input-test.csv')
calculator = PriceCalculator.new

data = []
params = {
  length: 22, 
  width: 16,
  height: 7.7,
  weight:1.5,
  service_code: 'AUS_PARCEL_REGULAR'
}
reader.as_hash.each do |line|
  response = calculator.run(line.dup.merge(params))
  puts "Price: AUD $#{response['total_cost']} - Delivery time: #{response['delivery_time']}"
  data << line.dup.merge(response.dup)
end

write = Writer.new('output-question-3.csv')
write.run(data)
