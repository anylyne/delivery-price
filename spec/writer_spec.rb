require 'spec_helper'
require './lib/writer'

describe Writer do
  let(:writer) { Writer.new('name.csv') }
  describe '#run' do
    let(:content_expected) do
      "Postcode,Delivery Postcode,Price,Delivery Time\n2040,2040,15.75,Delivered in Temporary delays\n2040,2049,15.75,Delivered in Temporary delays\n"
    end
    let(:data) do
      [
        {
          :from_postcode => '2040',
          :to_postcode => '2040',
          'total_cost' => '15.75',
          'delivery_time' => 'Delivered in Temporary delays'
        },
        {
          :from_postcode => '2040',
          :to_postcode => '2049',
          'total_cost' => '15.75',
          'delivery_time' => 'Delivered in Temporary delays'
        }
      ]
    end
    it 'shoud format the content properly' do
      expect(writer.run(data)).to eq(content_expected)
    end
  end
  describe '#run_with_options' do
    let(:content_expected) do
      "Postcode,Delivery Postcode,Regular (Bx1),Regular (Bx4),Regular (Bx8),Express (Bx1),Express (Bx4),Express (Bx8)\n2040,2040,14.0,19.0,15.0,18.0,16.0,17.0\n2040,2049,19.0,24.0,20.0,23.0,21.0,22.0\n"
    end
    let(:data) do
      [{
        :from_postcode => '2040',
        :to_postcode => '2040',
        '22.0x16.0x7.7AUS_PARCEL_REGULAR' => '14.0',
        '36.3x21.2x6.5AUS_PARCEL_REGULAR' => '19.0',
        '43.0x30.5x14.0AUS_PARCEL_REGULAR' => '15.0',
        '22.0x16.0x7.7AUS_PARCEL_EXPRESS' => '18.0',
        '36.3x21.2x6.5AUS_PARCEL_EXPRESS' => '16.0',
        '43.0x30.5x14.0AUS_PARCEL_EXPRESS' => '17.0'
      },
       {
         :from_postcode => '2040',
         :to_postcode => '2049',
         '22.0x16.0x7.7AUS_PARCEL_REGULAR' => '19.0',
         '36.3x21.2x6.5AUS_PARCEL_REGULAR' => '24.0',
         '43.0x30.5x14.0AUS_PARCEL_REGULAR' => '20.0',
         '22.0x16.0x7.7AUS_PARCEL_EXPRESS' => '23.0',
         '36.3x21.2x6.5AUS_PARCEL_EXPRESS' => '21.0',
         '43.0x30.5x14.0AUS_PARCEL_EXPRESS' => '22.0'
       }]
    end
    it 'shoud format the content properly' do
      expect(writer.run_with_options(data)).to eq(content_expected)
    end
  end
end
