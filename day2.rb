require 'json'
require 'rest-client'

url = 'https://watcha.net/evalmore/category.json?page=1&per=12&category_idx=35'

header = { 'cookie' => '_s_guit=bc524ab340177ffdc2161e1f58fed35788dd45c1f00a441082c557e790bc; domain=.watcha.net; path=/; expires=Fri, 02-Apr-2038 07:19:36 GMT; HttpOnly; secure'}
result = RestClient.get(url, header)
parsed = JSON.parse(result)

@itemList = Array.new
parsed["cards"].each do |card|
  card["items"].each do |item|
    @itemList << item["item"]
  end
end

puts parsed["cards"]
