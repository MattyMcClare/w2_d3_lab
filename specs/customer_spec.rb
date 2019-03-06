require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')


class TestCustomer < MiniTest::Test

  def setup()
    @customer = Customer.new("Gertrude", 100, 76, 0)
    @customer1 = Customer.new("Brian", 2, 18, 11)
    @customer_kid = Customer.new("Billy", 100, 13, 0)
    @drink = Drink.new("Mojito", 7, 3)
    @pub = Pub.new("4042", 2000, @drink)
  end

  def test_name()
    assert_equal("Gertrude", @customer.name)
  end

  def test_wallet()
    assert_equal(100, @customer.wallet)
  end

  def test_take_drink()
    @customer.take_drink(@drink)
    assert_equal(1, @customer.count_drinks())
    assert_equal(3, @customer.customer_drunkenness)
  end

  def test_decrease_wallet()
    @customer.decrease_wallet(@drink)
    assert_equal(93, @customer.check_wallet)
  end

  def test_buy_drink()
    @customer.buy_drink(@drink)
    assert_equal(1, @customer.count_drinks())
    assert_equal(93, @customer.check_wallet)
  end

  def test_buy_drink__kid()
    @customer_kid.buy_drink(@drink)
    assert_equal(0, @customer_kid.count_drinks())
    assert_equal(100, @customer_kid.check_wallet)
  end

  def test_check_age()
    assert_equal(76, @customer.check_age)
  end

  def test_check_old_enough()
    assert_equal(true, @customer.old_enough?)
  end

  def test_check_old_enough__kid()
    assert_equal(false, @customer_kid.old_enough?)
  end

  def test_customer_drunkenness()
    assert_equal(0, @customer.customer_drunkenness)
  end

  def test_get_drunk()
    @customer.get_drunk(@drink)
    assert_equal(3, @customer.customer_drunkenness)
  end

  def test_too_drunk__yes()
    assert_equal(true, @customer1.too_drunk?())
  end

  def test_too_drunk__no()
    assert_equal(false, @customer.too_drunk?())
  end

end
