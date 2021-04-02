# frozen_string_literal: true

require 'spec_helper'
require './lib/price_calculator'

describe PriceCalculator do
  let(:token) { YAML.load_file('./the_api.yml')['token'] }
  let(:price_calculator) { PriceCalculator.new }

  describe '#format_url' do
    let(:api_url) { YAML.load_file('./the_api.yml')['url'] }

    it 'shoud return only the api url when receive no parameter' do
      expect(price_calculator.format_url(nil)).to eq(nil)
      expect(price_calculator.format_url([])).to eq(nil)
    end

    it 'shoud concat the parameters properly' do
      url = price_calculator.format_url({ 'key' => 'value',
                                          'key_1' => 'value_1' })
      expect(url).to eq("#{api_url}?key=value&key_1=value_1")
    end
  end
end
