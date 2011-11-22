Product.delete_all
File.open('db/games_names.txt', 'r') do |file|
  100.times do |n|
    #Product.create!(:name => Faker::Lorem.words.join(' '))
    Product.create!(name: file.gets.strip)
    print '.'
  end
end
