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
    20.times do
      item = Item.new(random_item)
      item.categories << Category.first
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
      "Fruit Baskets",
    ]
  end

  def random_item
    [
      {title: "Purely Fruit", description: "Complete with crisp apples, juicy oranges, and sweet pears, this sophisticated gift is guaranteed to please.", price: 39.99},
      {title: "Orchard's Abundance", description: "Complete with Vermont cheddar cheese, premium Virginia peanuts, and handcrafted popcorn, this classic arrangement is perfect for any occasion.", price: 79.99},
      {title: "Estate Collection", description: "Complete with over 20 tempting treats, including chocolate covered fruit, classic Vermont cheddar, and crunchy classic cookies, this sophisticated gift is guaranteed to delight no matter the occasion.", price: 149.99},
      {title: "Orchard's Treats", description: "Complete with a robust farmhouse cheddar, hearty hors d'oeuvre crackers, and delicate wafer cookies, this timeless gift offers a variety of treats that are guaranteed to please.", price: 39.99},
      {title: "Nature's Picnic", description: "Among our crisp apples, juicy pears, and vibrant oranges, this exquisite basket boasts an assortment of gourmet treats, like robust cheddar cheese and tender summer sausage, which all come together in this artful arrangement that's perfect for any occasion.", price: 39.99},
      {title: "Boutiful Harvest", description: "Irresistible snacks, like classic farmhouse cheddar, handcrafted popcorn, and a hearty trail mix, this generous gift is perfect for any occasion!", price: 99.99},
      {title: "Dipping Delight", description: "Inside, you'll find an assortment of ultra-premium fruits accompanied by a high quality fondue warmer, super delicious chocolate dipping sauce complete with tea light and forks. Guaranteed to impress, the Fondue Delight Gift Basket is a gourmet gift basket they are sure to love!", price: 59.99},
      {title: "Signature Series", description: "Inside, you'll find an assortment of ultra-premium fruits accompanied by a high quality fondue warmer, super delicious chocolate dipping sauce complete with tea light and forks. Guaranteed to impress, the Fondue Delight Gift Basket is a gourmet gift basket they are sure to love!", price: 229.99}
    ].sample
  end
end

Seed.start
