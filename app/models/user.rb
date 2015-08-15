class User < ActiveRecord::Base
  has_many :skill_sets
  has_many :gave_skill_sets

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
end
