require 'csv'

class Writer
  def initialize(name)
    @name = name
  end

  def run(data)
    content = "Postcode,Delivery Postcode,Price,Delivery Time\n"
    data.each do |line|
      content << "#{line[:from_postcode]},"
      content << "#{line[:to_postcode]},"
      content << "#{line['total_cost']},"
      content << "#{line['delivery_time']}\n"
    end
    File.write("./files/#{@name}", content)
    content
  end

  def run_with_options(data)
    content = 'Postcode,Delivery Postcode,'
    content << 'Regular (Bx1),Regular (Bx4),Regular (Bx8),'
    content << "Express (Bx1),Express (Bx4),Express (Bx8)\n"
    data.each do |line|
      content << content_line(line)
    end
    File.write("./files/#{@name}", content)
    content
  end

  def content_line(line)
    content = "#{line[:from_postcode]},"
    content << "#{line[:to_postcode]},"
    content << "#{line['22.0x16.0x7.7AUS_PARCEL_REGULAR']},"
    content << "#{line['36.3x21.2x6.5AUS_PARCEL_REGULAR']},"
    content << "#{line['43.0x30.5x14.0AUS_PARCEL_REGULAR']},"
    content << "#{line['22.0x16.0x7.7AUS_PARCEL_EXPRESS']},"
    content << "#{line['36.3x21.2x6.5AUS_PARCEL_EXPRESS']},"
    content << "#{line['43.0x30.5x14.0AUS_PARCEL_EXPRESS']}\n"
    content
  end
end
