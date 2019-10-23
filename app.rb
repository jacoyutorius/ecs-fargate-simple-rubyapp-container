require 'faraday'
require 'json'

COLUMNS = %i[full_name description html_url created_at].freeze
URL = 'https://api.github.com'.freeze

conn = Faraday::Connection.new(url: URL)
res = conn.get('/users/jacoyutorius/starred')
stars = JSON.parse(res.body)
stars.each do |star|
  puts star.slice(*COLUMNS.map(&:to_s))
  sleep 1
end