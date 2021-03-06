require 'test_helper'

class ObjectiveTest < ActiveSupport::TestCase
  objective = Objective.find_by(name: 'defend house')
  recipe = objective.recipes.first
  child_objective = Objective.find_by(name: 'attack blue house')
  master_objective = Objective.find_by(name: 'defend house')
  previous_objective = Objective.find_by(name: 'attack blue house')
  next_objective = Objective.find_by(name: 'defend house')

  test 'has recipes' do
    assert_equal 'Recipe', recipe.class.name
  end

  test 'has directions' do
    direction = recipe.directions.first
    assert_equal 'Direction', direction.class.name
  end

  test 'has slaves' do
    child = master_objective.slaves.first
    assert_equal 'Objective', child.class.name
  end

  test 'has no slaves' do
    assert child_objective.slaves.empty?
  end

  test 'has master' do
    master = child_objective.master
    assert_equal 'Objective', master.class.name
  end

  test 'has no master' do
    assert_not master_objective.master
  end

  test 'has users' do
    assert_equal 'User', objective.users.first.class.name
  end

  test 'has a strategy' do
    assert_equal 'Strategy', objective.strategy.class.name
  end

  test 'has a next objective' do
    assert_equal 'Objective', previous_objective.next.class.name
  end

  test 'has a previous objective' do
    assert_equal 'Objective', next_objective.previous.first.class.name
  end
end
