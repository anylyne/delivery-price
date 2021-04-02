require './lib/reader'
require './lib/writer'
require './lib/price_calculator'

reader = Reader.new('./files/input-test.csv')
calculator = PriceCalculator.new

data = []
reader.as_hash.each do |line|
  data_line = {}
  data_line[:from_postcode] = line[:from_postcode]
  data_line[:to_postcode] = line[:to_postcode]
  
  params = line.dup.merge({weight: 20})
  ['AUS_PARCEL_REGULAR', 'AUS_PARCEL_EXPRESS'].each do |service_code|
    ["22.0x16.0x7.7", "36.3x21.2x6.5", "43.0x30.5x14.0"].each do |dimension_option|
      parts = dimension_option.split("x")
      specific_params = params.dup.merge({ service_code: service_code, 
                                                 length: parts[0], 
                                                  width: parts[1],
                                                 height: parts[2]
                                        })
      response = calculator.run(specific_params)
      data_line[dimension_option+service_code] = response['total_cost']
      data_line[:delivery_time] = response['delivery_time']
    end
  end
  data << data_line
end

write = Writer.new('output-question-4.csv')
write.run_with_options(data)
