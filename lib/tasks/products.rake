def empty_dir(path)
  #Dir.entries(path).reject { |entry| ['.', '..'].include? entry }.each { |f| File.delete("#{path}/#{f}") }
  FileUtils.rm_rf Dir.glob("#{path}/*")
end

def grab_description(productname, desc_url)
  desc_element = Nokogiri::HTML(open desc_url).at_css(".productDescriptionWrapper")
  desc_element.nil? ? '' : desc_element.text.strip
end

desc "Fetch products data from Amazon"
task :products => :environment do
  require "nokogiri"
  require "open-uri"

  url = 'http://www.amazon.com/Best-Sellers-Video-Games-Game-Downloads/zgbs/videogames/979455011/ref=zg_bs_979455011_pg_2?_encoding=UTF8&pg='
  Product.delete_all

  (1..5).each do |n|
    doc = Nokogiri::HTML(open("#{url}#{n}"))

    doc.css(".zg_itemRow").each do |item|
      name = item.at_css('.zg_title').text.strip

      desc_url = item.at_css('.zg_title a')[:href].strip
      description = grab_description name, desc_url

      Product.create!(name: name, description: "#{description}")
      print '.'
    end
    puts "\n#{n}===================================="
  end
end
