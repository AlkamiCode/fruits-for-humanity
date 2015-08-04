class Seed
  def self.start
    new.generate
  end

  def generate
    create_items
    create_users
  end

  def create_users
    User.create(username: "new_user", password: "new_user", email_address: "user@gmail.com")
    User.create(username: "admin", password: "admin", email_address: "admin@gmail.com", role: 1)
  end

  def create_items
    create_categories
    50.times do
      item = Item.new(random_item)
      item.categories << Category.all.sample
      item.save
    end
    puts "#{Item.all.map(&:title).join(', ')} created."
  end

  def create_categories
    categories.each do |category_name|
      Category.create(name: category_name)
    end
  end

  private

  def categories
    [
      "Fruit",
      "Vegitable",
      "Mix"
    ]
  end

  def random_item
    [
      {title: "Granola", description: "wholesome", price: 1.50},
      {title: "Apple", description: "nutritious and sweet", price: 3.50},
      {title: "Grapefruit", description: "healthy and sour", price: 2.00},
      {title: "Banana", description: "fatty and yellow", price: 14.00},
      {title: "Salad", description: "vegetarian", price: 15.00},
      {title: "Chocolate", description: "sweet", price: 6.99},
      {title: "Coffee", description: "energizing", price: 3.75},
      {title: "Tea", description: "soothing", price: 8},
      {title: "Pasta", description: "classic", price: 2.00},
      {title: "Cheese", description: "mmmmm", price: 9},
      {title: "Bread", description: "wholesome", price: 4.25},
      {title: "Peanut Butter",  description: "protein-packed", price: 52},
      {title: "Caviar", description: "super expensive", price: 6},
      {title: "Jam", description: "sweet!", price: 2},
      {title: "Jelly", description: "sweeter!", price: 12},
      {title: "Preserves", description: "fruity", price: 23},
      {title: "Smoothie", description: "delish", price: 13},
      {title: "Carrots", description: "full of fiber", price: 6},
      {title: "Cereal", description: "perfect for breakfast", price: 86},
      {title: "Blackberries", description: "my favorite!", price: 5},
      {title: "cupcake", description: "mmmmm", price: 9},
      {title: "muffin", description: "wholesome", price: 4.25},
      {title: "Almond Butter",  description: "protein-packed", price: 52},
      {title: "cookie dogh", description: "super expensive", price: 6},
      {title: "Jamsky", description: "sweet!", price: 2},
      {title: "Jelly welly", description: "sweeter!", price: 12},
      {title: "Panorama", description: "fruity", price: 23},
      {title: "table", description: "delish", price: 13},
      {title: "squash", description: "full of fiber", price: 6},
      {title: "oats", description: "perfect for breakfast", price: 86},
      {title: "fresas", description: "my favorite!", price: 5}
    ].sample
  end
end

Seed.start
