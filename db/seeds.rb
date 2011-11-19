Product.delete_all
50.times do |n|
  Product.create!(:name => Faker::Lorem.words.join(' '))
end
