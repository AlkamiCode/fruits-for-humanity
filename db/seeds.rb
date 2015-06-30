class Seed
  def self.start
    new.generate
  end

  def generate
    create_items
  end

  def create_items
    create_categories
    50.times { Category.all.sample.items.create(item.sample) }
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

  def item
    [
      [title: "Granola", description: "wholesome", price: 1],
      [title: "Apple", description: "nutritious and sweet", price: 3],
      [title: "Grapefruit", description: "healthy and sour", price: 2],
      [title: "Banana", description: "fatty and yellow", price: 4],
      [title: "Salad", description: "vegetarian", price: 5],
      [title: "Chocolate", description: "sweet", price: 6],
      [title: "Coffee", description: "energizing", price: 3],
      [title: "Tea", description: "soothing", price: 8],
      [title: "Pasta", description: "classic", price: 2],
      [title: "Cheese", description: "mmmmm", price: 9],
      [title: "Bread", description: "wholesome", price: 4],
      [title: "Peanut Butter",  description: "protein-packed", price: 52],
      [title: "Caviar", description: "super expensive", price: 6],
      [title: "Jam", description: "sweet!", price: 2],
      [title: "Jelly", description: "sweeter!", price: 12],
      [title: "Preserves", description: "fruity", price: 23],
      [title: "Smoothie", description: "delish", price: 13],
      [title: "Carrots", description: "full of fiber", price: 6],
      [title: "Cereal", description: "perfect for breakfast", price: 86],
      [title: "Blackberries", description: "my favorite!", price: 5]
    ]
  end
end

Seed.start
