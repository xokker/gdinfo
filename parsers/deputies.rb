require 'uri'
require 'net/http'
require 'json'
require 'nokogiri'
require 'pg'

require 'active_support'
require 'active_support/multibyte/chars'
require 'active_support/core_ext/string/multibyte'

conn = PG.connect(dbname: 'gdinfo', port: 2000, host: 'localhost', user: 'postgres')
puts "connected to DB"

def get_party(text)
  text = text.mb_chars.downcase

  if text.include?('единая россия')
    "Единая Россия"
  elsif text.include?('справедливая')
    "Справедливая Россия"
  elsif text.include?('яблоко')
    "Яблоко"
  elsif text.include?('лдпр') || text.include?('либерально')
    "ЛДПР"
  elsif text.include?('коммунистическая')
    "КПРФ"
  else
    raise "can't find party: #{text}"
  end
end

id_regex = /\/structure\/deputies\/([\d]+)\//

token = "9872d44a4bd94c7f9b8d95d0829c9eee834e3391"
app_token = "appfff9f36a927fa2d7f818da02c17002271a35a0dd"

base_url = "http://api.duma.gov.ru/api/#{token}/deputies.json?app_token=#{app_token}&current=1&position=Депутат ГД"

uri = URI(URI::encode(base_url))
result = Net::HTTP.get(uri)

json = JSON.parse(result)

no_photo = 0
count = json.count
i = 0

json.each do |dep|
  last_name, first_name, middle_name = dep['name'].split(' ')
  api_id = dep['id']

  is_current = dep['isCurrent'] == true ? 1 : 0

  conn.exec("insert into deputy (first_name, last_name, middle_name, api_id, is_current) values ('#{first_name}', '#{last_name}', '#{middle_name}', '#{api_id}', '#{is_current}')")
  i+=1
  puts "processing #{i}/#{count}, #{last_name}"

  search_url = URI::encode("http://www.duma.gov.ru/structure/deputies/?name=#{dep['name']}")
  doc = Nokogiri::HTML(Net::HTTP.get(URI(search_url)))

  link = doc.css(".table-data .row-first a")[0]



  if link
    site_id = link['href'].match(id_regex)[1]
    puts "parsed #{site_id}"

    small_photo = link.children[0]["src"]

    profile_url = "http://www.duma.gov.ru/structure/deputies/#{site_id}/"
    doc = Nokogiri::HTML(Net::HTTP.get(URI(profile_url)))

    big_photo_node = doc.css(".deputat-info-left img")
    big_photo = if big_photo_node.size > 0
      big_photo_node[0]["src"]
    else
    end

    description = doc.css(".deputat-info-intro").text
    party_name = get_party(description)

    conn.exec("update deputy set small_photo_url='#{small_photo}', big_photo_url='#{big_photo}', site_id='#{site_id}', description='#{description}', party_name='#{party_name}' where api_id=#{api_id}")
  else
    puts "no photo: #{dep['name']}"
    no_photo += 1
  end

end

puts "no_photo: #{no_photo}"
