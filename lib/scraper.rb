require 'open-uri'
require 'nokogiri'

def scrape_etsy(keyword)
  # filepath = "lib/results.html"
  # 1. We get the HTML page content
  # html_content = File.open(filepath)
  html_content = URI.open("https://www.etsy.com/search?q=#{keyword}", "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML.parse(html_content)

  # create a hash for my etsy_items
  etsy_items = {}
  doc.search('.v2-listing-card__info .v2-listing-card__title').each do |element|
    item = element.text.strip.split.first(6).join(' ')
    etsy_items[item] = false
  end
  # return a hash of the etsy items
  etsy_items
end
# doc.search('.n-listing-card__price .currency-value').each do |element|
#   p element.text.strip
#   puts
# end
