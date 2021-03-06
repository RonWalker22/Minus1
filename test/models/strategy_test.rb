require 'test_helper'
class StrategyTest < ActiveSupport::TestCase
  setup do
    @strategy = strategies(:one)
    @strategy_one = strategies(:one)
    @strategy_three = strategies(:three)
  end

  test 'has users' do
    assert_equal 'User', @strategy.users.first.class.name
  end

  test 'has a commander' do
    assert_equal 'User', @strategy.commander.class.name
  end

  test 'has objectives' do
    assert_equal 'Objective', @strategy.objectives.first.class.name
  end

  test 'has a mode' do
    assert_equal 'Mode', @strategy.mode.class.name
  end

  test 'has an inpiration' do
    assert_equal 'Strategy', @strategy_three.inspiration.class.name
  end

  test 'has inpirations' do
    assert_equal 'Strategy', @strategy_one.inspirations.first.class.name
  end
end
