require 'open-uri'
require 'json'

class FlatsController < ApplicationController
  def index
    @url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    json = URI(@url).read
    @flats = JSON.parse(json)
  end

  def show
    index
    id = params['id'].to_i
    @flat = @flats.find { |flat| flat['id'] == id }
  end
end
