require 'faraday_middleware'


# configure Faraday for Rest API
Rest = Faraday::Connection.new url: "http://ec2-54-191-98-78.us-west-2.compute.amazonaws.com:8080" do |conn|

  # auth
  #conn.use NutmegTokenAuthentication
  conn.headers['Content-Type'] = 'application/json'

  # encodes ruby Hashes/Arrays in POST bodies as "application/json"
  conn.request :url_encoded
  conn.request :json

  # decodes string responses as JSON and rashifies the resulting Hash/Array
  conn.response :rashify
  conn.response :json

  conn.response :logger
  conn.adapter Faraday.default_adapter
end