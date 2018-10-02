#!/usr/local/bin/ruby

require 'sinatra'

set :bind, '0.0.0.0'

get '/' do
  @version = 1

  <<-EOF
  <html>
    <head>
      <title>Kubernetes Demo</title>
    </head>
    <body>
      <div>
        <p>Version: #{@version}</p>
        <p>Pod name: #{ENV["MY_POD_NAME"]}</p>
        <p>Pod IP: #{ENV["MY_POD_IP"]}</p>
        <p>Node: #{ENV["MY_NODE_NAME"]}</p>
      </div>
    </body>
  </html>
  EOF
end
