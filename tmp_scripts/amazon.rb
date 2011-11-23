# for expirements

require "rubygems"
require "nokogiri"
require "open-uri"

url = 'http://www.amazon.com/Digital-SLRs-Cameras-Photo/b/ref=amb_link_6742562_1?ie=UTF8&node=3017941&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=center-5&pf_rd_r=0VGJA3MFRDFRCZX42DR6&pf_rd_t=101&pf_rd_p=1266111442&pf_rd_i=515382011'
doc = Nokogiri::HTML(open(url))

doc.css(".product").each do |item|
  name = item.at_css('.srTitle').text.strip
  print '.'
  
  #p "#{i.at_css('.srTitle').text} - #{i.at_css('.listprice, .otherprice').text}"
  src_url = item.at_css('img')[:src]
  filename = File.basename(src_url)
  #system("cd #{Rails.root}/public/amazon_photos/I; curl -sOR #{src_path}")
  system("curl --silent --remote-time --output public/amazon_photos/I/#{filename} #{src_url}")
end
