# pushover.rb
# frozen_string_literal: true

require 'yaml'
require 'net/http'

module Pushover
  API_URI = 'https://api.pushover.net/1/messages.json'
  
  def self.send(message, parameters = {})
    body = { message: message }.merge(parameters)
    
    Net::HTTP.post_form(URI(API_URI), body)
  end

  def self.load_config(file)
    YAML.load_file(file)
  end

  def self.save_config(file, params)
    File.write(file, params.to_yaml)
  end
end