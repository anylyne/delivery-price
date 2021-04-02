require 'httparty'

class PriceCalculator
  THE_API = YAML.load_file('./the_api.yml')

  def initialize
    @token = THE_API['token']
    @api_url = THE_API['url']
  end

  def run(params)
    result = HTTParty.get(format_url(params), headers: {
                            'Content-Type' => 'application/json',
                            'AUTH-KEY' => @token
                          })
    result['postage_result']
  end

  def format_url(params)
    return if params.nil? || params.empty?

    key_value = []
    params.each { |key, value| key_value << "#{key}=#{value}" }
    "#{@api_url}?#{key_value.join('&')}"
  end
end
