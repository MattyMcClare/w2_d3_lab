class Customer

attr_reader :name, :wallet

  def initialize(name, wallet, age, drunkenness)
    @name = name
    @wallet = wallet
    @customer_drinks = []
    @age = age
    @drunkenness = drunkenness
  end

  def check_age()
    return @age
  end

  def customer_drunkenness()
    return @drunkenness
  end

  def count_drinks()
    return @customer_drinks.count
  end

  def get_drunk(drink)
    @drunkenness += drink.alcohol_level
  end

  def take_drink(drink)
    if (@customer_drinks << drink)
      get_drunk(drink)
    end
  end

  def check_wallet()
    return @wallet
  end

  def decrease_wallet(drink)
    cost = drink.price
    @wallet -= cost
  end

  def old_enough?()
    return @age >= 18
  end

  def too_drunk?()
    return @drunkenness > 10
  end

  def buy_drink(drink)
    if old_enough?()
      take_drink(drink)
      decrease_wallet(drink)
    end
  end
end
