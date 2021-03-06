class StrategyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return false unless user.game_setting_id

    if record.class == Class
      Game.find(user.game_setting_id).status == 'supported'
    else
      record.game.status == 'supported'
    end
  end

  def create?
    record.game.status == 'supported'
  end

  def create_objective?
    return true if record.commander.id == user.id

    record.teams.includes(:users).each do |team|
      if team.users.include?(user)
        member = UserTeam.find_by(team_id: team.id, user_id: user.id)
        return true unless member.title == 'User'
      end
    end
    false
  end

  def update_objective?
    create_objective?
  end

  def destroy?
    record.commander == user
  end

  def edit?
    return true if record.commander.id == user.id

    record.teams.includes(:users).each do |team|
      if team.users.include?(user)
        member = UserTeam.find_by(team_id: team.id, user_id: user.id)
        return true unless member.title == 'User'
      end
    end
    false
  end
end
