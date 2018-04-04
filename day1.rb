require 'rest-client'
require 'json'

lottoNumbers = Array.new
url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=644'
res = RestClient.get(url)
parsed = JSON.parse(res)

6.times do |i|
  lottoNumbers << parsed["drwtNo#{i + 1}"]
end
p "Lotto Numbers are #{lottoNumbers}"

myNumbers = Array.new
6.times do
  allNumbers = Array(1..45)
  temp = allNumbers.sample
  allNumbers.delete(temp)
  myNumbers << temp
end
p "My Numbers are #{myNumbers}"

matchedNumbers = Array.new

myNumbers.each do |number|
  if lottoNumbers.include?(number)
    p "yes"
    matchedNumbers << number
  else
    p "no"
  end
end

p matchedNumbers

case matchedNumbers.count
when 0
  p "0"
when 1
  p "1"
when 2
  p "2"
when 3
  p "3"
when 4
  p "4"
when 5
  p "5"
when 6
  p "6"
end
