class User < ActiveRecord::Base
  has_many :skill_sets
  has_many :my_skill_sets, -> { mine }
  has_many :gave_skill_sets, -> { given }
  has_many :abilities
  has_one :current_ability, -> { newer }

  # あるユーザに対するスキル評価
  #
  # @param [User] target スキル評価対象ユーザ
  # @param [Array<Skill>] skills 評価したスキル一覧
  # @return [void]
  def give(target, skills)
    SkillSet.create(
      user: target,
      skills: skills,
    )
  end

  # 能力値の集計を行う
  def evaluate_ability
  end
end
