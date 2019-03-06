require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')


class TestPub < MiniTest::Test

  def setup
    @customer = Customer.new("Gertrude", 100, 76, 0)
    @drink1 = Drink.new("Guinness", 4, 2)
    @drink2 = Drink.new("Peroni", 3, 2)
    @drink3 = Drink.new("Manhattan", 6, 4)
    @drink4 = Drink.new("Mojito", 7, 3)
    @all_drinks = [@drink1, @drink2, @drink3, @drink4]
    @pub = Pub.new("4042", 2000, @all_drinks)
  end

  def test_name()
    assert_equal("4042", @pub.name)
  end

  def test_till()
    assert_equal(2000, @pub.till)
  end

  def test_count_drinks()
    assert_equal(4, @pub.count_drinks)
  end

  def test_lose_drink()
    @pub.lose_drink(@drink4)
    assert_equal(3, @pub.count_drinks)
  end

  def test_increase_till()
    @pub.increase_till(@drink4)
    assert_equal(2007, @pub.check_till())
  end

  def test_sell_drink()
    @pub.sell_drink(@drink4)
    assert_equal(3, @pub.count_drinks)
    assert_equal(2007, @pub.check_till())
  end

  def test_make_transaction()
    @pub.make_transaction(@customer, @drink4)
    assert_equal(3, @pub.count_drinks)
    assert_equal(2007, @pub.check_till())
    assert_equal(1, @customer.count_drinks())
    assert_equal(93, @customer.check_wallet)
    assert_equal(false, @customer.too_drunk?)
  end

end
