require 'test_helper'

class OperatorStrategyTest < ActiveSupport::TestCase
  operator_strat = OperatorStrategy.all[random_index]
  setup do
    @operator = operators(:one)
    @strategy = strategies(:one)
  end

  test 'disallows duplicate OperatorStrategy' do
    begin
      OperatorStrategy.create!(operator_id: @operator.id,
                               strategy_id: @strategy.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
  test 'has a primary objective' do
    assert_equal 'Objective', operator_strat.primary.class.name
  end
  test 'has a secondary objective preference' do
    assert_equal 'Objective', operator_strat.secondary.class.name
  end
  test 'has a tertiary objective preference' do
    assert_equal 'Objective', operator_strat.tertiary.class.name
  end
  test 'has a default objective preference' do
    assert_equal 'Objective', operator_strat.default.class.name
  end
end
