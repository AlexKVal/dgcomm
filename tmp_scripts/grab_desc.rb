require "rubygems"
require "nokogiri"
require "open-uri"

DESCRIPTIONS_DIR = "tmp_scripts/descriptions"
#empty_dir DESCRIPTIONS_DIR
FileUtils.rm_rf Dir.glob("#{DESCRIPTIONS_DIR}/*")
#system "rm -r #{DESCRIPTIONS_DIR}/*"
#system "mkdir #{DESCRIPTIONS_DIR}"

def grab_description(productname, desc_url)
  desc_element = Nokogiri::HTML(open desc_url).at_css(".productDescriptionWrapper")
  unless desc_element.nil?
    File.open("#{DESCRIPTIONS_DIR}/#{productname}.txt", 'w') {|f| f.puts desc_element.text.strip}
  end
end

url = 'http://www.amazon.com/Best-Sellers-Video-Games-Game-Downloads/zgbs/videogames/979455011/ref=zg_bs_979455011_pg_2?_encoding=UTF8&pg='
#filename = 'db/games_names.txt'
#File.open(filename, 'w') do |file|
(1..5).each do |n|
  doc = Nokogiri::HTML(open("#{url}#{n}"))

  doc.css(".zg_itemRow").each do |item|
    name = item.at_css('.zg_title').text.strip

    desc_url = item.at_css('.zg_title a')[:href].strip
    grab_description name, desc_url

    #file.puts name
    print '.'
  end
  puts "\n#{n}===================================="
end
#end


#======= first ver ===
# def grab_description(productname, desc_url)
#   tries_remain = 3
#   until tries_remain.zero?
#     #puts "tries: #{tries_remain}"
#     desc_element = Nokogiri::HTML(open desc_url).css(".productDescriptionWrapper")
#     if desc_element
#       puts "desc_element = True"
#       unless desc_element.css("p").count.zero?
#         description = ''
#         desc_element.css("p").each do |paragraph|
#           description = description + paragraph.text.strip
#           print 'p'
#         end
#         unless description.strip! !~ /\S/
#           File.open("#{DESCRIPTIONS_DIR}/#{productname}.txt", 'w') {|f| f.puts description}
#           break
#         end
#       end
#       puts "description is blank"
#     end
#
#     puts "desc_element = False"
#     tries_remain -= 1
#   end
# end
