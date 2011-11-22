require "rubygems"
require "nokogiri"
require "open-uri"

url = 'http://www.amazon.com/Best-Sellers-Video-Games-Game-Downloads/zgbs/videogames/979455011/ref=zg_bs_979455011_pg_2?_encoding=UTF8&pg='
filename = 'db/games_names.txt'
File.open(filename, 'w') do |file|
  (1..5).each do |n|
    doc = Nokogiri::HTML(open("#{url}#{n}"))

    doc.css(".zg_itemRow").each do |item|
      name = item.at_css('.zg_title').text.strip
      #p name
      file.puts name
      print '.'

      #p "#{i.at_css('.srTitle').text} - #{i.at_css('.listprice, .otherprice').text}"
      #src_url = item.at_css('img')[:src]
      #filename = File.basename(src_url)
      #system("cd #{Rails.root}/public/amazon_photos/I; curl -sOR #{src_path}")
      #system("curl --silent --remote-time --output public/amazon_photos/I/#{filename} #{src_url}")
      #puts "\n===================================="
    end
    puts "\n#{n}===================================="
  end
end
