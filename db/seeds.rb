Product.delete_all
10.times do |n|
  Product.create!(:name => Faker::Lorem.words.join(' '))
end
