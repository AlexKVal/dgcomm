File.open('db/games_names.txt', 'r') do |file|
  100.times do |n|
    p file.gets.strip
  end
end
