require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')


class TestDrink < MiniTest::Test

  def setup
    @drink = Drink.new("Cobra", 5, 2)
  end

  def test_name()
    assert_equal("Cobra", @drink.name)
  end

  def test_price()
    assert_equal(5, @drink.price)
  end

  def test_alcohol_level()
    assert_equal(2, @drink.alcohol_level)
  end

end
