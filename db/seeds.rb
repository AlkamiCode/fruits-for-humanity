class Seed
  def self.start
    new.generate
  end

  def generate
    create_items
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
      "Root",
      "Grass",
      "Meat",
      "Other"
    ]
  end

  def random_item
    [
      {title: "Granola", description: "wholesome", price: 1.50, image: nil},
      {title: "Apple", description: "nutritious and sweet", price: 3.50, image: nil},
      {title: "Grapefruit", description: "healthy and sour", price: 2.00, image: nil},
      {title: "Banana", description: "fatty and yellow", price: 14.00, image: nil},
      {title: "Salad", description: "vegetarian", price: 15.00, image: nil},
      {title: "Chocolate", description: "sweet", price: 6.99, image: nil},
      {title: "Coffee", description: "energizing", price: 3.75, image: nil},
      {title: "Tea", description: "soothing", price: 8, image: nil},
      {title: "Pasta", description: "classic", price: 2.00, image: nil},
      {title: "Cheese", description: "mmmmm", price: 9, image: nil},
      {title: "Bread", description: "wholesome", price: 4.25, image: nil},
      {title: "Peanut Butter",  description: "protein-packed", price: 52, image: nil},
      {title: "Caviar", description: "super expensive", price: 6, image: nil},
      {title: "Jam", description: "sweet!", price: 2, image: nil},
      {title: "Jelly", description: "sweeter!", price: 12, image: nil},
      {title: "Preserves", description: "fruity", price: 23, image: nil},
      {title: "Smoothie", description: "delish", price: 13, image: nil},
      {title: "Carrots", description: "full of fiber", price: 6, image: nil},
      {title: "Cereal", description: "perfect for breakfast", price: 86, image: nil},
      {title: "Blackberries", description: "my favorite!", price: 5, image: nil}
    ].sample
  end
end

Seed.start
