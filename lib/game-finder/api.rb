require 'httparty'
require 'json'
require 'uri'
require 'colorize'

require 'game-finder/config'
require 'game-finder/out'

include Config

# Provides helper methods for interacting with the Game Bomb API
module Api
  API_URI = 'https://www.giantbomb.com/api'.freeze

  def request(path, params)
    # Add default parameters if they are not set
    params[:api_key] = config.api_key unless params.key?('api_key') || params.key?(:api_key)
    params[:format] = 'json' unless params.key?('json')

    resp = HTTParty.get("#{API_URI}/#{path}?#{param_string(params)}",
                        headers: { 'User-Agent' => 'game-finder' })

    raise 'Unable to find what youre looking for' if resp.code == 404
    raise 'Oops something went wrong!' if resp.code != 200

    JSON.parse(resp.body)
  rescue StandardError => e
    exit Out.error "Failed to make request: #{e}"
  end

  def param_string(parameters)
    parameters.map { |k, v| URI.escape("#{k}=#{v}") }.join('&')
  end
end
