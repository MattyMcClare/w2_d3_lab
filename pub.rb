class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def count_drinks()
    @drinks.count
  end

  def lose_drink(name)
    for drink in @drinks
      if (drink == name)
        @drinks.delete(drink)
      end
    end

  end

  def check_till
    return @till
  end

  def increase_till(drink)
    cost = drink.price
    @till += cost
  end

  def sell_drink(drink)
    lose_drink(drink)
    increase_till(drink)
  end

  def make_transaction(customer, drink)
    if customer.too_drunk?() == false
      customer.buy_drink(drink)
      sell_drink(drink)
    end
  end
end
