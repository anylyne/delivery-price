require 'csv'

class Reader
  def initialize(file_path)
    @file_path = file_path
  end

  def as_hash
    results = []
    CSV.parse(File.open(@file_path), headers: true) do |row|
      results << {
        from_postcode: get_postcode(row['Address']),
        to_postcode: row['Postcode'],
        length: row['Length'], width: row['Width'], height: row['Height'],
        weight: row['Weight'], service_code: row['Service']
      }
    end
    results
  end

  def get_postcode(address)
    address&.split(' ')&.last
  end
end
