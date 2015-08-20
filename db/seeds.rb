class Seed
  def self.start
    new.generate
  end

  def generate
    create_category_items
    create_users
  end

  def create_users
    User.create(username: "new_user", password: "new_user", email_address: "user@gmail.com")
    User.create(username: "admin", password: "admin", email_address: "admin@gmail.com", role: 1)
  end

  def create_category_items
    create_categories
    fruit_baskets.each do |basket|
      item = Item.new(basket)
      item.categories << Category.all[0]
      item.save
    end
    dried_fruit.each do |basket|
      item = Item.new(basket)
      item.categories << Category.all[1]
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
      "Dried Fruit & Nuts"
    ]
  end

  def dried_fruit
    [
      {title: "Almond Strawberry Delight", description: "The newest star in our classic line of designer gifts! In a beautiful matte finished box, we've paired our gourmet roasted and salted peanuts with a medley of premium dried fruits for a delectable, guilt-free snack that's sure to be enjoyed.", price: 19.99},
      {title: "Mendocino Gift Crate", description: "Mendocino County in California is the birthplace to many great products and we have gathered the best in this amazing gift pack. The deliciousness of Mendocino's Cashews, Almonds, Cherry Fruit Cocktail and Strawberry Honey Crunch will leave anyone with a smile. Give this great tasting gift of Mendocino in this classy wooden gift crate and bring the Mendocino county to anyone's doorstep.", price: 37.99},
      {title: "Dried Fruit & Nut Platter", description: "This impressive gift is as pleasing to the eye as it is to the palate! Inside a beautiful gift box are over 2.5 pounds of premium nuts and extra fancy dried fruits that are artfully arranged in an elegant rose pattern. Boasting dried Bing cherries, Angelino plums, and California peaches, this exquisite gift is impossible to resist!", price: 49.99},
      {title: "Naughty And Nice", description: "This stunning display is sure to please every palate, as it boasts an unbeatable combination of irresistible treats! In two separate boxes, your recipient will discover beautiful arrangements of delicious snacks, both indulgent and healthy. Complete with sinful handcrafted truffles, extra-fancy dried fruits, and an assortment of premium nuts, this exquisite arrangement makes the perfect gift at any occasion!", price: 79.99},
      {title: "Roasted Nut Crate", description: "For nut lovers out there, it doesn't get much better than this! We have searched far and wide to find the best selection of ultra-premium nuts that have been roasted and salted to perfection! Inside this incredible nut gift basket they'll find pistachios, peanuts, cashews and almonds. Nuts are a delicious and nutritious snack that are good for you, and your heart. So send this incredible design from our collection of nut gift baskets and know they'll savor every last crunchy bite.", price: 39.99},
      {title: "Dried Fruit Platter", description: "A healthy and delicious gift, this impressive platter is as pleasing to the eye as it is to the palate! On a beautifully woven plate, your recipient will discover a sophisticated selection of artfully arranged dried fruits. Boasting dried California Angelino Plums, Yellow Peaches, and Mediterranean Apricots, this exquisite gift is impossible for anyone resist!", price: 29.99},
      {title: "Gourmet Trey", description: "Without question, it’s the very definition of elegant simplicity: a well-made, visually appealing wooden box tray filled with two full pounds of our finest gourmet treats. Simple, because there are no frills or distractions; elegant, because the tray presents just four of our most prized all-natural snack selections, including hard-to-find Jumbo Cashews and Colossal Pistachios. There’s no picking through or sorting out required, because every corner contains some of the best gourmet snacking available today. It begins with our acclaimed Salted Giant Whole Cashews: extra-large, first-quality unbroken nuts that have been roasted to creamy perfection and then lightly salted to bring out their exceptional flavor. Your recipient will find them absolutely irresistible—and that’s only the beginning!", price: 19.99},
      {title: "Deluxe Trey", description: "Sweet Extravagance Deluxe Tray: This beautifully presented tray includes enough premium dried fruit, savory with savory and sweet nuts is sure to delight an office or family gathering. Includes: 2 lbs., 8 oz. of: Dried Fruit (Dried Apricots, Dried Pears, Dried Angelino Plums, Dried Peaches, Dried Apples, Dried Blenheim Apricots, Prunes, Dates, Date Nut Rolls coated with Coconut), 5 oz. Cinnamon Toffee Almonds, 4 oz. Roasted Salted Pistachios in the Shell, 6.5 oz. Praline Pecans, 6 oz. Cherries Berries and Nuts Trail Mix, in Wooden Tray with carved handles tied with gift ribbon", price: 59.99}
    ]
  end

  def fruit_baskets
    [
      {title: "Purely Fruit", description: "No matter the occasion, this beautiful arrangement is sure to delight! Inside a classic willow branch basket, your recipient will discover a collection of irresistibly fresh fruits that are hand selected from some of the finest gourmet orchards. Complete with crisp apples, juicy oranges, and sweet pears, this sophisticated gift is guaranteed to please.", price: 39.99},
      {title: "Orchard's Abundance", description: "With something for everyone, it's no surprise that this delightful gift is one of our most popular! Inside our signature willow branch basket, we've artfully arranged juicy oranges, crisp apples, and sweet pears, along with an assortment of delicious gourmet foods. Complete with Vermont cheddar cheese, premium Virginia peanuts, and handcrafted popcorn, this classic arrangement is perfect for any occasion.", price: 79.99},
      {title: "Estate Collection", description: "Easily one of our grandest gifts, this stunning display offers something for everyone! Inside a handled willow branch basket, your recipient will discover an unparalleled collection of exquisite handpicked orchard fruits that are artfully arranged among a bounty of delicious gourmet snacks. Complete with over 20 tempting treats, including chocolate covered fruit, classic Vermont cheddar, and crunchy classic cookies, this sophisticated gift is guaranteed to delight no matter the occasion.", price: 149.99},
      {title: "Orchard's Treats", description: "This thoughtful arrangement is guaranteed to delight no matter the occasion. Inside a beautiful basket, your recipient will discover a selection of hand-picked fresh orchard fruits that are nestled amongst a variety of classic gourmet snacks. Complete with a robust farmhouse cheddar, hearty hors d'oeuvre crackers, and delicate wafer cookies, this timeless gift offers a variety of treats that are guaranteed to please.", price: 39.99},
      {title: "Nature's Picnic", description: "Whether it's in the park or on the living room floor, no picnic is complete without fresh fruit! And since these are delivered to us from the orchard on a daily basis, our fruits are the freshest around. Among our crisp apples, juicy pears, and vibrant oranges, this exquisite basket boasts an assortment of gourmet treats, like robust cheddar cheese and tender summer sausage, which all come together in this artful arrangement that's perfect for any occasion.", price: 39.99},
      {title: "Boutiful Harvest", description: "Easily one of our most popular arrangements, this exquisite gift is sure to impress. Inside a beautiful willow branch basket, your recipient will discover an exquisite arrangement of freshly harvest orchard fruits, including crisp apples, juicy oranges, and sweet pears, that are nestled amongst coveted gourmet foods. Complete with irresistible snacks, like classic farmhouse cheddar, handcrafted popcorn, and a hearty trail mix, this generous gift is perfect for any occasion!", price: 99.99},
      {title: "Dipping Delight", description: "Our unique fruit & fondue gift baskets are sure to be a huge hit for any occasion! One of our most unique gourmet gifts, this sensational design gives you everything you need to enjoy a unique gourmet snack! Inside, you'll find an assortment of ultra-premium fruits accompanied by a high quality fondue warmer,  super delicious chocolate dipping sauce complete with tea light and forks. Guaranteed to impress, the Fondue Delight Gift Basket is a gourmet gift basket they are sure to love!", price: 59.99},
      {title: "Signature Series", description: "Perfect for families, teams, and executives, this stunning gift is sure to impress! Inside a classic willow branch basket, we've hand arranged an unparalleled selection of over 25 decadent gourmet foods and tempting treats. Boasting something for everyone, including irresistibly ripe orchard fruits, a classic Vermont cheddar cheese, and a collection of exquisite cookies, this generous gift guaranteed to leave them speechless no matter the occasion!", price: 229.99}
    ]
  end
end

Seed.start
