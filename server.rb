#!/usr/local/bin/ruby

require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

get '/' do
  content_type 'application/json'

  @version = 2
  @@hits ||= 0

  @@hits += 1

  {
    version: @version,
    pod_name: ENV['MY_POD_NAME'],
    pod_ip: ENV['MY_POD_IP'],
    node_name: ENV['MY_NODE_NAME'],
    hits: @@hits
  }.to_json
end
