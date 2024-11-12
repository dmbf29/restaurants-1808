# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Adam Arisa Bart Brian Chafique Christian Claudia Denis Dylan Esteban Henry Jarod Loris Mark Mason PhyuPhyu Roman Steven Stuart Toby Tristan Will]
CATEGORIES = %W[burger ramen sushi desserts healthy kebabs pizza tacos sandwiches dumplings soup curry rice pasta steakhouse vegan bakery juice salads seafood brunch wings cafe bbq deli pies buffet pub brasserie shakes creamery grill]

def get_category(name)
  last_word = name.split.last.downcase
  CATEGORIES.include?(last_word) ? last_word : CATEGORIES.sample
end

puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|
  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: "#{rand(1..3)}-#{rand(1..11)} Meguro, Meguro ku, Tokyo, Japan",
    category: get_category(restaurant_name)
  )
end
puts "... created #{Restaurant.count} restaurants"
