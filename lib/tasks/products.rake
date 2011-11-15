def empty_dir(path)
  Dir.entries(path).reject { |entry| ['.', '..'].include? entry }.each { |f| File.delete("#{path}/#{f}") }
end

desc "Fetch products off Amazon"
task :products => :environment do
  require "nokogiri"
  require "open-uri"

  path_to_photos = "#{Rails.root}/public/amazon_photos/I"
  url = 'http://www.amazon.com/Digital-SLRs-Cameras-Photo/b/ref=amb_link_6742562_1?ie=UTF8&node=3017941&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=center-5&pf_rd_r=0VGJA3MFRDFRCZX42DR6&pf_rd_t=101&pf_rd_p=1266111442&pf_rd_i=515382011'
  doc = Nokogiri::HTML(open(url))

  Product.delete_all
  empty_dir(path_to_photos)

  max, longest_name = 0, ''

  doc.css(".product").each do |item|
    name = item.at_css('.srTitle').text.strip
    if max < name.size then max = name.size; longest_name = name end
    
    src_url = item.at_css('img')[:src]
    filename = File.basename(src_url)
    system("curl --silent --remote-time --output #{path_to_photos}/#{filename} #{src_url}")
    
    Product.create!(name: name)
    print '.'
    #p "#{i.at_css('.srTitle').text} - #{i.at_css('.listprice, .otherprice').text}"
    #p i.at_css('a')[:href]
  end

  puts "\nmax = #{max} \nname= #{longest_name}"
  puts "Imported #{doc.css(".product").size} products."
end
