# pushover.rb
# frozen_string_literal: true

require 'yaml'
require 'net/http'

##
# A simple ruby module for sending notifications via Pushover.
#
# Requires a free pushover account: https://pushover.net/.
#
# ==Example:
#   require 'pushover'
#   
#   Pushover.send('Your message', user: 'pushover_user_key', token: 'pushover_application_token')
#   
#   default_pushover_config = Pushover.load_config('/path/to/pushover.conf')
#   default_pushover_config[:title] = 'Title'
#   Pushover.save_config('/path/to/pushover.conf', default_pushover_config)
#   
#   Pushover.send('Another message', default_pushover_config)
#
# For more info on which parameters are available, see https://pushover.net/api.
#
# NOTE: This module does not currently support image attachments.
module Pushover
  # Pushover API endpoint
  API_URI = 'https://api.pushover.net/1/messages.json'
  
  # Send a notification. Parameters must at least include :user => 'pushover_user_key'
  # and :token => 'pushover_application_token'
  def self.send(message, parameters = {})
    body = { message: message }.merge(parameters)
    
    Net::HTTP.post_form(URI(API_URI), body)
  end

  # Load configuration from a YAML-formatted text file
  def self.load_config(file)
    YAML.load_file(file)
  end

  # Save configuration to a YAML-formatted text file
  def self.save_config(file, params)
    File.write(file, params.to_yaml)
  end
end