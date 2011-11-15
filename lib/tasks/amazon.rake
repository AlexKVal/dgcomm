desc "Fetch products off Amazon"
task :products => :environment do
  require "nokogiri"
  require "open-uri"

  url = 'http://www.amazon.com/Digital-SLRs-Cameras-Photo/b/ref=amb_link_6742562_1?ie=UTF8&node=3017941&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=center-5&pf_rd_r=0VGJA3MFRDFRCZX42DR6&pf_rd_t=101&pf_rd_p=1266111442&pf_rd_i=515382011'
  doc = Nokogiri::HTML(open(url))

  Product.delete_all
  max = 0
  longest_name = ''
  doc.css(".product").each do |item|
    name = item.at_css('.srTitle').text.strip
    if max < name.size
      max = name.size
      longest_name = name
    end
    Product.create!(name: name)
    print '.'
    #p "#{i.at_css('.srTitle').text} - #{i.at_css('.listprice, .otherprice').text}"
    #p i.at_css('a')[:href]
  end

  puts "\nmax = #{max} \nname= #{longest_name}"
  puts "Imported #{doc.css(".product").size} products."
end
