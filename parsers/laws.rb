require 'uri'
require 'net/http'
require 'json'
require 'nokogiri'
require 'pg'

require 'active_support'
require 'active_support/multibyte/chars'
require 'active_support/core_ext/string/multibyte'

CONN = PG.connect(dbname: 'gdinfo', port: 2000, host: 'localhost', user: 'postgres')
puts "connected to DB"

TOKEN = "9872d44a4bd94c7f9b8d95d0829c9eee834e3391"
APP_TOKEN = "appfff9f36a927fa2d7f818da02c17002271a35a0dd"

def get_collection(topic, page)
  base_url = "http://api.duma.gov.ru/api/#{TOKEN}/search.json?app_token=#{APP_TOKEN}&topic=#{topic}&sort=date&page=#{page}"

  uri = URI(URI::encode(base_url))
  result = Net::HTTP.get(uri)

  JSON.parse(result)

end

def insert_from(json, topic)
  json['laws'].each do |law|
    law_id = law['id']

    query = "insert into law (api_id, law_number, law_name, last_event_date, topic) values ('#{law_id}', '#{law['number']}', '#{law['name']}', '#{law['lastEvent']['date']}', '#{topic}')"
    CONN.exec(query)
    puts query

    if subject = law['subject']
      deps = subject['deputies'] || []
      deps.each do |sub|
        query = "insert into deputy_low (law_id, deputy_api_id) values (#{law_id}, #{sub['id']})"
        begin
          CONN.exec query
        rescue => e
          puts e.inspect
        end
        puts query
      end
    end
  end
end

[62698, 62699, 62700, 62701, 62702, 62703].each do |topic|
  page = 1

  json = get_collection(topic, page)
  insert_from(json, topic)

  page = json['count'] / 20
  page.times do |p|
    if p > 1
      json = get_collection(topic, p)
      insert_from(json, topic)
    end
  end



end